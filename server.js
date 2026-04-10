//initializes
const mongoose = require('mongoose');
const express = require('express');
const cors = require('cors');
const path = require('path');
const dotenv = require('dotenv');
const dotenvExpand = require('dotenv-expand');
const myEnv = dotenv.config();
dotenvExpand.expand(myEnv);

//app
const app = express();

//port
const port = process.env.PORT || 6400;

//routes
const productRoute = require('./routes/product');
const homeRoute = require('./routes/home');
const cartRoute = require('./routes/cart');
const userRoute = require('./routes/user');
const authRoute = require('./routes/auth');

//middleware
app.use(cors());

app.use(express.static(path.join(__dirname, '/public')));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//view engine
app.set('view engine', 'ejs');
app.set('views', 'views');

app.disable('view cache');

app.use('/', homeRoute);
app.use('/products', productRoute);
app.use('/carts', cartRoute);
app.use('/users', userRoute);
app.use('/auth', authRoute);

//mongoose
mongoose.set('useFindAndModify', false);
mongoose.set('useUnifiedTopology', true);

const connectDB = async () => {
	try {
		await mongoose.connect(process.env.DATABASE_URL, { useNewUrlParser: true });
		console.log('✓ MongoDB conectado com sucesso');
		
		const server = app.listen(port, () => {
			console.log(`✓ Servidor rodando em http://localhost:${port}`);
			console.log(`✓ Ambiente: ${process.env.NODE_ENV || 'desenvolvimento'}`);
		});

		// Graceful shutdown
		process.on('SIGTERM', () => {
			console.log('\n✓ SIGTERM recebido. Encerrando gracefully...');
			server.close(() => {
				console.log('✓ Servidor finalizado');
				mongoose.connection.close(false, () => {
					console.log('✓ Conexão MongoDB fechada');
					process.exit(0);
				});
			});
		});
	} catch (err) {
		console.error('✗ Erro ao conectar MongoDB:', err.message);
		process.exit(1);
	}
};

connectDB();

module.exports = app;

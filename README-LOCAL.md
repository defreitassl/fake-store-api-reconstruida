# 📚 Getting Started - Desenvolvimento e Deploy

## 🚀 DEPLOY RÁPIDO

**Quer colocar a API no ar em 30 minutos?**

👉 **Leia o arquivo [`DEPLOY.md`](./DEPLOY.md)** - Guia completo passo a passo!

---

## 💻 Setup Local (Desenvolvimento)

### Pré-requisitos
- Node.js 17+
- MongoDB rodando localmente (ou use MongoDB Atlas)
- npm ou yarn

### Instalação

1. **Clone/Copie o repositório**
```bash
cd fake-store-api
```

2. **Instale as dependências**
```bash
npm install
```

3. **Configure o arquivo .env**
```bash
cp .env.example .env
# Edite .env com suas credenciais MongoDB
```

4. **Inicie o servidor**
```bash
npm run dev      # Modo desenvolvimento (com hot reload)
# ou
npm start        # Modo produção
```

5. **Teste a API**
```bash
curl http://localhost:8765/products
```

---

## 📖 Recursos Principais

### Endpoints Disponíveis

**Produtos**
- `GET /products` - Listar todos os produtos
- `GET /products/:id` - Obter um produto específico
- `POST /products` - Criar novo produto
- `PUT /products/:id` - Atualizar produto
- `DELETE /products/:id` - Deletar produto

**Carrinhos**
- `GET /carts` - Listar carrinhos
- `GET /carts/:id` - Obter carrinho específico
- `POST /carts` - Criar carrinho
- `PUT /carts/:id` - Atualizar carrinho
- `DELETE /carts/:id` - Deletar carrinho

**Usuários**
- `GET /users` - Listar usuários
- `GET /users/:id` - Obter usuário específico
- `POST /users` - Criar novo usuário
- `PUT /users/:id` - Atualizar usuário
- `DELETE /users/:id` - Deletar usuário

**Autenticação**
- `POST /auth/login` - Fazer login (retorna JWT token)

---

## 🏗️ Estrutura do Projeto

```
fake-store-api/
├── controller/      # Lógica de negócio
├── model/          # Schemas MongoDB
├── routes/         # Definição de rotas
├── views/          # Templates EJS (documentação)
├── public/         # Arquivos estáticos
├── __test__/       # Testes Jest
├── server.js       # Arquivo principal
├── package.json    # Dependências
├── Dockerfile      # Setup Docker
└── .env            # Variáveis de ambiente
```

---

## 🧪 Testes

```bash
# Rodar todos os testes
npm test

# Rodar com coverage
npm test -- --coverage
```

---

## 🐳 Docker Compose (Desenvolvimento)

```bash
# Iniciar API + MongoDB
docker-compose up

# Parar
docker-compose down
```

---

## 📝 Variáveis de Ambiente

```env
# Banco de dados
DATABASE_URL=mongodb+srv://usuario:senha@cluster.mongodb.net/fake_store

# Aplicação
PORT=8765
NODE_ENV=development
```

---

## 🚀 Deploy em Produção

### Opções Recomendadas

1. **Render.com** ⭐ (Recomendado para escola)
   - Free tier: 750h/mês
   - Deploy automático do GitHub
   - MongoDB Atlas compatível
   - [Ver guia de deploy](./DEPLOY.md)

2. **Railway.app**
   - Free tier: 500h/mês
   - Interface moderna
   - Suporte chat 24/7

3. **Fly.io**
   - Pago por uso (~$3-5/mês)
   - Distribuído globalmente

### Quick Deploy (Render)

```bash
# 1. Faça push no GitHub
git push origin main

# 2. Conecte no Render.com
# - Selecione o repositório
# - Defina DATABASE_URL
# - Deploy!
```

---

## 📞 Suporte

### Problemas Comuns

**MongoDB não conecta?**
- Verifique `DATABASE_URL` em `.env`
- Certifique-se que MongoDB está rodando
- Para Atlas: verifique IP whitelist

**Porta em uso?**
- Mude `PORT` no `.env`
- Ou use: `PORT=3000 npm start`

**CORS bloqueado?**
- CORS já está habilitado no código
- Verifique `/server.js` linha de CORS

---

## 📄 Arquivos Importantes

- [`DEPLOY.md`](./DEPLOY.md) - Guia completo de deployment
- [`CHANGES.md`](./CHANGES.md) - Alterações feitas para produção
- [`.env.example`](./.env.example) - Template de variáveis

---

## 📊 Tech Stack

- **Runtime**: Node.js 17
- **Framework**: Express.js
- **Database**: MongoDB
- **Auth**: JWT (jsonwebtoken)
- **Security**: bcryptjs, CORS
- **Views**: EJS
- **Testing**: Jest
- **Container**: Docker

---

## 📜 Licença

ISC

---

## ✨ Créditos

Baseado no [Fake Store API original](https://fake-store-api-reconstruida.onrender.com)

Preparado para deploy escolar com ❤️

---

**Próximo passo:** Leia [`DEPLOY.md`](./DEPLOY.md) para colocar a API no ar!


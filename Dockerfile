FROM node:17-alpine

WORKDIR /usr/src/app

# Copiar apenas package.json primeiro (para melhor cache do Docker)
COPY package*.json ./

# Instalar apenas dependências de produção
RUN npm ci --only=production

# Copiar o resto do código
COPY . .

# Expor porta
EXPOSE 8765

# Comando para iniciar a aplicação
CMD ["node", "server.js"]
# 🚀 Guia de Deploy - Fake Store API

## 📌 Prerequisitos
- Conta no GitHub com o repositório pushado
- Conta no Render.com (grátis)
- Conta no MongoDB Atlas (grátis)

---

## 1️⃣ Preparar MongoDB Atlas (Banco de Dados)

### Passo 1: Criar conta
1. Acesse [mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas)
2. Clique em "Start Free"
3. Crie sua conta (ou faça login)

### Passo 2: Criar cluster grátis
1. Clique em "Create" → "Create a Deployment"
2. Selecione "M0 Free" (grátis)
3. Escolha Cloud Provider e Region (Ex: AWS, us-east-1)
4. Clique "Create"

### Passo 3: Configurar acesso
1. Vá em "Database Access" (menu esquerdo)
2. Clique "Add New Database User"
3. Username: `fakestore`
4. Password: `SuaSenhaForte123!` (guarde isso!)
5. Built-in Role: "Atlas Admin"
6. Clique "Add User"

### Passo 4: Configurar IP de acesso
1. Vá em "Network Access"
2. Clique "Add IP Address"
3. Selecione "Allow access from anywhere" (0.0.0.0/0) - mais fácil para dev
4. Clique "Confirm"

### Passo 5: Obter connection string
1. Volte em "Database"
2. Clique "Connect" no seu cluster
3. Selecione "Connect your application"
4. Copie a string MongoDB (parece com isso):
```
mongodb+srv://fakestore:SENHA@seu-cluster.mongodb.net/fake_store?retryWrites=true&w=majority
```
5. Substitua `SENHA` pela senha que criou
6. **Guarde essa string!**

---

## 2️⃣ Preparar Repositório GitHub

### Passo 1: Fazer push do código
```bash
cd fake-store-api
git init
git add .
git commit -m "Initial commit - Fake Store API ready for deploy"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/fake-store-api.git
git push -u origin main
```

### Passo 2: Criar `.env.production` (opcional)
Se quiser, crie um arquivo para manter controle:
```
DATABASE_URL=mongodb+srv://fakestore:SENHA@seu-cluster.mongodb.net/fake_store?retryWrites=true&w=majority
NODE_ENV=production
PORT=8765
```

> ⚠️ **NÃO comite `.env.production` no GitHub!** Use as variáveis do Render.

---

## 3️⃣ Deploy no Render.com

### Passo 1: Criar conta
1. Acesse [render.com](https://render.com)
2. Clique "Sign up"
3. Escolha "Sign up with GitHub" (mais fácil)
4. Autorize o Render a acessar sua conta GitHub

### Passo 2: Criar novo Web Service
1. Vá em Dashboard
2. Clique "New +" → "Web Service"
3. Selecione seu repositório `fake-store-api`
4. Clique "Connect"

### Passo 3: Configurar o serviço
Preencha os campos:

| Campo | Valor |
|-------|-------|
| **Name** | fake-store-api |
| **Environment** | Node |
| **Build Command** | `npm install` |
| **Start Command** | `node server.js` |
| **Instance Type** | Free |

### Passo 4: Adicionar variáveis de ambiente
1. Role até "Environment Variables"
2. Adicione:

| Key | Value |
|-----|-------|
| `NODE_ENV` | `production` |
| `DATABASE_URL` | (cole a string do MongoDB Atlas) |
| `PORT` | `8765` |

Exemplo de DATABASE_URL:
```
mongodb+srv://fakestore:SuaSenhaForte123!@seu-cluster.mongodb.net/fake_store?retryWrites=true&w=majority
```

### Passo 5: Deploy
1. Clique em "Deploy"
2. Espere 3-5 minutos (primeira build demora mais)
3. Quando ficar verde "Live", seu deploy está pronto! ✅

---

## 4️⃣ Testando a API

Após o deploy, você receberá uma URL como:
```
https://fake-store-api-xxxxx.onrender.com
```

### Testes rápidos:

**Listar produtos:**
```bash
curl https://fake-store-api-xxxxx.onrender.com/products
```

**Documentação:**
```
https://fake-store-api-xxxxx.onrender.com/
```

### Com Insomnia/Postman:
- GET `https://fake-store-api-xxxxx.onrender.com/products`
- GET `https://fake-store-api-xxxxx.onrender.com/products/1`
- POST `https://fake-store-api-xxxxx.onrender.com/auth/login`

---

## 5️⃣ Compartilhar com Alunos

Após validar que a API está funcionando, compartilhe a URL:

```
https://fake-store-api-xxxxx.onrender.com/
```

**Para substituir a API oficial nos projetos dos alunos:**

Nos arquivos JavaScript donde usam a API antiga:
```javascript
// ANTES
const API_URL = 'https://fakestoreapi.com'

// DEPOIS
const API_URL = 'https://fake-store-api-xxxxx.onrender.com'
```

---

## ⚠️ Observações Importantes

### Cold Starts (Inicialização lenta)
- Free tier do Render hiberna após 15 min sem uso
- Primeira requisição após hibernação demora 30-50 seg
- **Solução**: Usar paid tier ($7/mês) ou manter aquecido com pingador

### Limites Free Tier Render
- 750 horas de runtime/mês (suficiente para escola)
- 100GB de dados transferidos/mês
- Sem SSL nativo (Render fornece HTTPS automático)

### Limites MongoDB Atlas Free
- 512MB de armazenamento
- Suficiente para dados fake

### Se precisar de mais performance
1. **Render Paid**: $7-12/mês
2. **Railway.app**: $5/mês (similar feature set)
3. **Fly.io**: Pago por uso (geralmente $3-5/mês)

---

## 🔄 Atualizações Futuras

Quando precisar atualizar o código:
```bash
git add .
git commit -m "Descrição da mudança"
git push origin main
```

Render detecta a mudança e faz deploy automaticamente (em 1-2 minutos)! ✅

---

## 📞 Troubleshooting

**API não está iniciando?**
- Verifique DATABASE_URL nas variáveis do Render
- Verifique IP whitelist no MongoDB Atlas
- Veja os logs: Dashboard → Logs

**Status 502 Bad Gateway?**
- Aguarde 2-3 minutos (build pode estar acontecendo)
- Verifique variáveis de ambiente
- Reinicie: Dashboard → Manual Redeploy

**Banco de dados não conecta?**
- Use MongoDB Atlas String (não local mongodb://)
- Teste a string localmente antes

---

## ✅ Checklist Final

- [ ] MongoDB Atlas criado e rodando
- [ ] Connection string testada localmente
- [ ] Repositório GitHub com código atualizado
- [ ] Render.com Web Service criado
- [ ] Variáveis de ambiente configuradas
- [ ] Deploy bem-sucedido (status "Live")
- [ ] API respondendo em endpoints (GET /products, etc)
- [ ] URL compartilhada com alunos

---

**Pronto! Sua API está no ar! 🎉**

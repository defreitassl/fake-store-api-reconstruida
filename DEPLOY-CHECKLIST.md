# ✅ Checklist de Deploy - Fake Store API

Use este checklist para garantir que tudo está configurado corretamente.

---

## 📋 Pré-Deploy (Preparação Local)

### Código
- [ ] Todos os testes passando (`npm test`)
- [ ] Sem erros de lint
- [ ] Variáveis de ambiente configuradas (`.env`)
- [ ] Arquivo `.env` adicionado ao `.gitignore` ✅
- [ ] Arquivo `DEPLOY.md` lido e entendido

### Repositório GitHub
- [ ] Código pushado no GitHub: `git push origin main`
- [ ] Repositório é **PÚBLICO** (Render precisa acessar)
- [ ] Branch principal é `main` ou `master`

### Testes Locais
- [ ] Servidor rodando em desenvolvimento: `npm run dev`
- [ ] Endpoints respondendo:
  - [ ] GET `/` (home page)
  - [ ] GET `/products` (retorna array de produtos)
  - [ ] GET `/products/1` (retorna um produto)
  - [ ] GET `/users` (retorna array de usuários)

---

## 💾 MongoDB Atlas Setup

### Conta e Cluster
- [ ] Conta criada em [mongodb.com/cloud/atlas](https://mongodb.com/cloud/atlas)
- [ ] Cluster M0 Free criado
- [ ] Cluster está "Deployed" (verde)

### Segurança
- [ ] Database User criado:
  - [ ] Username: `fakestore`
  - [ ] Password: `SenhaForte123!` (guarnecida)
- [ ] IP Whitelist configurado:
  - [ ] `0.0.0.0/0` (allow anywhere) para desenvolvimento
  - [ ] Render IP depois (se necessário)

### Connection String
- [ ] String obtida do MongoDB:
  ```
  mongodb+srv://fakestore:SENHA@cluster.mongodb.net/fake_store?retryWrites=true&w=majority
  ```
- [ ] Testada localmente (funciona)
- [ ] Substitui `SENHA` pela senha real

---

## 🚀 Render.com Setup

### Conta
- [ ] Conta criada em [render.com](https://render.com)
- [ ] Conectada ao GitHub

### Web Service Criado
- [ ] Nome: `fake-store-api`
- [ ] Tipo: Node
- [ ] Repositório: `fake-store-api` (seu repo)
- [ ] Branch: `main`

### Build & Start
- [ ] Build Command: `npm install`
- [ ] Start Command: `node server.js`

### Variáveis de Ambiente
- [ ] Adicionadas no painel ("Environment Variables"):
  - [ ] `NODE_ENV` = `production`
  - [ ] `DATABASE_URL` = `mongodb+srv://fakestore:SENHA@...`
  - [ ] `PORT` = `8765`

### Deploy
- [ ] Clicou em "Deploy"
- [ ] Build começou (vê a barra de progresso)
- [ ] Aguardou 3-5 minutos
- [ ] Status mudou para "Live" (verde) ✅

---

## 🧪 Testes em Produção

### URL da API
- [ ] Recebeu URL como: `https://fake-store-api-reconstruida.onrender.com`
- [ ] Guardou essa URL em lugar seguro

### Teste Básico
```bash
# Em um terminal, execute:
curl https://fake-store-api-reconstruida.onrender.com/products

# Deve retornar um JSON com produtos
```

- [ ] GET `/` retorna página HTML (documentação)
- [ ] GET `/products` retorna lista de produtos
- [ ] GET `/products/1` retorna produto com ID 1
- [ ] GET `/users` retorna lista de usuários
- [ ] POST `/auth/login` (com credenciais) retorna token

### Ou use Insomnia/Postman
- [ ] Importou a URL base da API
- [ ] Testou endpoints:
  - [ ] GET /products
  - [ ] GET /products/1
  - [ ] GET /users
  - [ ] POST /auth/login

---

## 📢 Comunicação com Alunos

### Documentação
- [ ] Criou documento com a URL da API
- [ ] Enviou para alunos:
  - [ ] Via email
  - [ ] Via plataforma da escola
  - [ ] Via Discord/Slack (se usar)

### Instruções para Alunos
- [ ] Explicou como substituir URL antiga:
  ```javascript
  // ANTES
  const API_URL = 'https://fake-store-api-reconstruida.onrender.com'
  
  // DEPOIS
  const API_URL = 'https://fake-store-api-reconstruida.onrender.com'
  ```
- [ ] Enviou exemplos de requests (GET, POST, etc)
- [ ] Explicou que CORS está habilitado (sem problemas)

### Suporte
- [ ] Estabeleceu canal de suporte (email, Discord, etc)
- [ ] Testou receber e responder dúvidas

---

## 🔧 Manutenção Contínua

### Monitoramento
- [ ] Recebe emails sobre problemas
- [ ] Sabe onde ver os logs (Render Dashboard)
- [ ] Configurou uptime monitoring (uptimerobot.com) opcional

### Atualizações de Código
- [ ] Sabe que push no GitHub = deploy automático
- [ ] Testou fazer uma pequena mudança e fazer push
- [ ] Viu que Render fez o deploy automaticamente

### Backup de Dados
- [ ] Dados estão no MongoDB Atlas (backup automático)
- [ ] Sabe fazer export se necessário

---

## ⚠️ Troubleshooting

Se algo der errado, verifique:

### 502 Bad Gateway
- [ ] Aguardou 2-3 minutos (build pode estar acontecendo)
- [ ] Clicou "Manual Redeploy" no Render
- [ ] Verificou logs no Dashboard
- [ ] DATABASE_URL está correto

### API não conecta ao MongoDB
- [ ] DATABASE_URL está 100% correto
- [ ] Não há espaços extras na string
- [ ] IP whitelist inclui Render IPs
- [ ] Username e password estão certos

### Erro na primeira requisição
- [ ] Muito normal! Primeira requisição demora (cold start)
- [ ] Aguarde 30-50 segundos
- [ ] Configure uptimerobot.com para manter quente (opcional)

### Build falha
- [ ] Viu a mensagem de erro no log?
- [ ] `npm install` foi executado?
- [ ] Node modules foi instalado?

---

## ✏️ Notas Pessoais

Use este espaço para anotar informações importantes:

```
URL da API: _______________________________________________

MongoDB Connection String: _______________________________________________

Render Dashboard: _______________________________________________

Email de suporte: _______________________________________________

Dúvidas dos alunos comuns:
1. _________________________________________________
2. _________________________________________________
3. _________________________________________________
```

---

## 🎉 Conclusão

Se todos os itens estão marcados ✅, sua API está:
- ✅ Pronta em produção
- ✅ Acessível globalmente
- ✅ Funcionando corretamente
- ✅ Pronta para alunos usarem

**Parabéns! 🚀 Sua API Fake Store está no ar!**

---

## 📞 Precisa de Help?

1. **Leia novamente** `DEPLOY.md`
2. **Veja logs** no Render Dashboard
3. **Teste localmente** antes de fazer push
4. **Consulte** documentação MongoDB Atlas

---

Atualizado em: **Abril, 2026**



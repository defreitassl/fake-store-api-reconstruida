#!/bin/bash

# Script para testar se a API está funcionando
# Use: ./test-api.sh http://localhost:8765
# ou:  ./test-api.sh https://fake-store-api-reconstruida.onrender.com

if [ -z \"$1\" ]; then
    echo \"❌ Erro: Forneça a URL da API\"
    echo \"Uso: ./test-api.sh <URL_DA_API>\"
    echo \"Exemplo: ./test-api.sh http://localhost:8765\"
    exit 1
fi

API_URL=\"$1\"
TESTS_PASSED=0
TESTS_FAILED=0

echo \"🧪 Testando API: $API_URL\"
echo \"======================================\"
echo \"\"

# Teste 1: Home page (documentação)
echo \"📄 Teste 1: GET / (Home page)\"
if curl -s \"$API_URL/\" | grep -q \"FakeStore\"; then
    echo \"✅ PASSOU\"
    ((TESTS_PASSED++))
else
    echo \"❌ FALHOU\"
    ((TESTS_FAILED++))
fi
echo \"\"

# Teste 2: Listar produtos
echo \"📄 Teste 2: GET /products (Listar produtos)\"
if curl -s \"$API_URL/products\" | grep -q \"\\[\\|title\"; then
    echo \"✅ PASSOU\"
    ((TESTS_PASSED++))
else
    echo \"❌ FALHOU\"
    ((TESTS_FAILED++))
fi
echo \"\"

# Teste 3: Obter um produto
echo \"📄 Teste 3: GET /products/1 (Obter um produto)\"
if curl -s \"$API_URL/products/1\" | grep -q \"title\"; then
    echo \"✅ PASSOU\"
    ((TESTS_PASSED++))
else
    echo \"❌ FALHOU\"
    ((TESTS_FAILED++))
fi
echo \"\"

# Teste 4: Listar usuários
echo \"📄 Teste 4: GET /users (Listar usuários)\"
if curl -s \"$API_URL/users\" | grep -q \"username\\|email\"; then
    echo \"✅ PASSOU\"
    ((TESTS_PASSED++))
else
    echo \"❌ FALHOU\"
    ((TESTS_FAILED++))
fi
echo \"\"

# Teste 5: Listar carrinhos
echo \"📄 Teste 5: GET /carts (Listar carrinhos)\"
if curl -s \"$API_URL/carts\" | grep -q \"\\[\\|userId\\|products\"; then
    echo \"✅ PASSOU\"
    ((TESTS_PASSED++))
else
    echo \"❌ FALHOU\"
    ((TESTS_FAILED++))
fi
echo \"\"

echo \"======================================\"
echo \"📊 Resumo dos testes:\"
echo \"✅ PASSOU: $TESTS_PASSED\"
echo \"❌ FALHOU: $TESTS_FAILED\"
echo \"======================================\"
echo \"\"

if [ $TESTS_FAILED -eq 0 ]; then
    echo \"🎉 Todos os testes passaram! API está funcionando! ✨\"
    exit 0
else
    echo \"⚠️  Alguns testes falharam. Verifique a API.\"
    exit 1
fi



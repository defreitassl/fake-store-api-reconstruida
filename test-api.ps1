# Script para testar se a API está funcionando (Windows)
# Use: .\test-api.ps1 http://localhost:8765
# ou:  .\test-api.ps1 https://fake-store-api-xxxxx.onrender.com

param(
    [string]$ApiUrl = \"http://localhost:8765\"
)

if ([string]::IsNullOrEmpty($ApiUrl)) {
    Write-Host \"❌ Erro: Forneça a URL da API\" -ForegroundColor Red
    Write-Host \"Uso: .\\test-api.ps1 <URL_DA_API>\" -ForegroundColor Yellow
    Write-Host \"Exemplo: .\\test-api.ps1 http://localhost:8765\" -ForegroundColor Yellow
    exit 1
}

$testsPassed = 0
$testsFailed = 0

Write-Host \"🧪 Testando API: $ApiUrl\" -ForegroundColor Cyan
Write-Host \"======================================\" -ForegroundColor Cyan
Write-Host \"\"

function Test-Endpoint {
    param(
        [string]$Name,
        [string]$Endpoint,
        [string]$SearchTerm
    )
    
    Write-Host \"📄 Teste: GET $Endpoint\" -ForegroundColor Yellow
    try {
        $response = Invoke-RestMethod -Uri \"$ApiUrl$Endpoint\" -Method Get -TimeoutSec 5
        $responseStr = $response | ConvertTo-Json
        
        if ($responseStr -like \"*$SearchTerm*\") {
            Write-Host \"✅ PASSOU\" -ForegroundColor Green
            return $true
        } else {
            Write-Host \"❌ FALHOU\" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host \"❌ FALHOU: $_\" -ForegroundColor Red
        return $false
    }
}

# Teste 1: Home page
if (Test-Endpoint -Name \"Home\" -Endpoint \"/\" -SearchTerm \"FakeStore\") {
    $testsPassed++
} else {
    $testsFailed++
}
Write-Host \"\"

# Teste 2: Produtos
if (Test-Endpoint -Name \"Produtos\" -Endpoint \"/products\" -SearchTerm \"title\") {
    $testsPassed++
} else {
    $testsFailed++
}
Write-Host \"\"

# Teste 3: Um produto
if (Test-Endpoint -Name \"Produto 1\" -Endpoint \"/products/1\" -SearchTerm \"title\") {
    $testsPassed++
} else {
    $testsFailed++
}
Write-Host \"\"

# Teste 4: Usuários
if (Test-Endpoint -Name \"Usuários\" -Endpoint \"/users\" -SearchTerm \"username\") {
    $testsPassed++
} else {
    $testsFailed++
}
Write-Host \"\"

# Teste 5: Carrinhos
if (Test-Endpoint -Name \"Carrinhos\" -Endpoint \"/carts\" -SearchTerm \"userId\") {
    $testsPassed++
} else {
    $testsFailed++
}
Write-Host \"\"

Write-Host \"======================================\" -ForegroundColor Cyan
Write-Host \"📊 Resumo dos testes:\" -ForegroundColor Cyan
Write-Host \"✅ PASSOU: $testsPassed\" -ForegroundColor Green
Write-Host \"❌ FALHOU: $testsFailed\" -ForegroundColor Red
Write-Host \"======================================\" -ForegroundColor Cyan
Write-Host \"\"

if ($testsFailed -eq 0) {
    Write-Host \"🎉 Todos os testes passaram! API está funcionando! ✨\" -ForegroundColor Green
    exit 0
} else {
    Write-Host \"⚠️  Alguns testes falharam. Verifique a API.\" -ForegroundColor Yellow
    exit 1
}




$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_pregao"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "SC_Lote_Pregao_aberto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Solicitacao_Compra/SC_Lote_Pregao_aberto $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}

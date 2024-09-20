

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\COMPRA_DIRETA\Dispensa_OPD"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Compra_direta_disp_item_OPD.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Compra_Direta/Compra_Dispensa_item_OPD $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
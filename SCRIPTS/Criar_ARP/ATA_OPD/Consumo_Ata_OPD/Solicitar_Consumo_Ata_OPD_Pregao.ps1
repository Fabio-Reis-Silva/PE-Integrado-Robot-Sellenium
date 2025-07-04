

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_ARP\ATA_OPD\Consumo_ata_OPD"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Novo_consumo_ata_opd_compra_direta_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/ARP/ATA_OPD/Consumo_ata_OPD/Solicitar_consumo_ata_opd_compra_direta $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
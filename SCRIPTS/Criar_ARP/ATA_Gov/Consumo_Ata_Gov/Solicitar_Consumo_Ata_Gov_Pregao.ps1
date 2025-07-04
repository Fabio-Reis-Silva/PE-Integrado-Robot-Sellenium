

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_ARP\ATA_GOV\Consumo_ata_gov"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Novo_consumo_ata_gov_pregao_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/ARP/Ata_Gov/Consumo_Ata_Gov/Solicitar_consumo_ata_gov_pregao $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
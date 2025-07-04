

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_ARP\ATA_GOV\Criar_ata_gov"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Nova_ata_compra_Disp_item_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/ARP/Ata_Gov/Criar_Ata_Gov/Criar_ata_compra_Disp_item $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
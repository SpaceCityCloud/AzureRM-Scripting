# Set VM Name
 
$vmname01 = "azpubdc1"
$vmname02 = "azpubdevapp"
$vmname03 = "azpubdevweb"
$vmname04 = "azpubprodapp"
$vmname05 = "azpubprodweb"
$vmname06 = "azpubsql1"
$vmname07 = "azpubwebapp"
 
# Set name of VHD blob to copy
 
$vhdName01 = "AZPubDC1.vhd"
$vhdName02 = "AZPubDevApp.vhd"
$vhdName03 = "AZPubDevWeb.vhd"
$vhdName04 = "AZPubProdApp.vhd"
$vhdName05 = "AZPubProdWeb.vhd"
$vhdName06 = "AZPubSQL1.vhd"
$vhdName07 = "AZPubSQLDev.vhd"
$vhdName08 = "AZPubSQLProd.vhd"
$vhdName09 = "AZPubWebApp.vhd"

 
# Source Storage Account Information
 
$sourceSAName = "publicSharepoint"
 
$sourceSAKey = "AbCdEfGhIjKlMnOpQrStUvWxYz=="
 
$sourceSAContainerName = "vhds"

# Destination Storage Account Information
 
$destinationSAName = "sa-prodmigration"
$destinationSAKey = "1029384756=="
$destinationContainerName = "vhds"
 
# Source Storage Account Context
 
$sourceContext = New-AzureStorageContext -StorageAccountName $sourceSAName -StorageAccountKey $sourceSAKey
 
# Destination Storage Account Context
 
$destinationContext = New-AzureStorageContext –StorageAccountName $destinationSAName -StorageAccountKey $destinationSAKey
 
# Copy the blob
 
$blobCopy01 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName01 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy02 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName02 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy03 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName03 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy04 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName04 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy05 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName05 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy06 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName06 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy07 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName07 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy08 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName08 -Context $sourceContext -SrcContainer $sourceSAContainerName
$blobCopy09 = Start-AzureStorageBlobCopy -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName09 -Context $sourceContext -SrcContainer $sourceSAContainerName
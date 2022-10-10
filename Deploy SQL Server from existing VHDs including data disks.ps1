#Login-AzureRmAccount

#Get-AzureRmSubscription 

#Select-AzureRmSubscription -SubscriptionName "subscriptionName"

# You have to pre-create the NIC prior to running this script. It will not complete without a pre-existing NIC.

$nicName = "nic-azpubsql1"
$vmName = "AZPubSQL1"
$vmSize = "Standard_D12_v2"
$osDiskName = "dsk-azpubsql1"
$location = "East US 2"
$rgName = "rg_prod_VMs"

$nic = Get-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $rgName

$osDiskUri = "https://(saURL).blob.core.windows.net/vhds/AZPubSQL1.vhd"
$dataDiskUri1 = "https://(saURL).blob.core.windows.net/vhds/AZPubSQL1-SQLProd.vhd"
$dataDiskUri2 = "https://(saURL).blob.core.windows.net/vhds/AZPubSQL1-SQLDev.vhd"

$vmConfig1 = New-AzureRmVMConfig -VMName $vmName -VMSize $vmSize
$vmConfig2 = Set-AzureRmVMOSDisk -VM $vmConfig1 -Name $vmName -VhdUri $osDiskUri -CreateOption Attach -Windows
$vmConfig3 = add-AzureRmVMDataDisk -VM $vmConfig2 -Name 'ProdDataDisk' -Caching 'ReadWrite' -Lun 0 -VhdUri $dataDiskUri1 -CreateOption Attach
$vmConfig4 = add-AzureRmVMDataDisk -VM $vmConfig3 -Name 'DevDataDisk' -Caching 'ReadWrite' -Lun 1 -VhdUri $dataDiskUri2 -CreateOption Attach
$vmConfig5 = Add-AzureRmVMNetworkInterface -VM $vmConfig4 -Id $nic.Id
New-AzureRMVM -ResourceGroupName $rgName -Location $location -VM $vmconfig5
$nics = Get-WmiObject Win32_NetworkAdapter -filter "AdapterTypeID = '0' AND PhysicalAdapter = 'true'"
  
  
foreach ($nic in $nics)
  {
 
   $nicName = $nic.Name
 
   Write-Host "--- Disabling `"Allow the computer to turn off this device to save power`" on $nicName ---"
   $nicPower = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | where {$_.instancename -match [regex]::escape($nic.PNPDeviceID) }
   $nicPower.Enable = $False
   $nicPower.psbase.Put()}
   
   #http://justanothertechnicalblog.blogspot.com/2012/06/setting-power-management-options-on.html
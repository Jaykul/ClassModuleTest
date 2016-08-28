ipmo "$PSScriptRoot\Scenario3.psd1" -Force

$Object = New-TestObject3
write-Output (Get-TestObject3 -TestObject $Object)
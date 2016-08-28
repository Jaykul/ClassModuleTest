ipmo "$PSScriptRoot\Scenario2.psd1" -Force

$Object = New-TestObject2
Get-TestObject2 -TestObject $Object
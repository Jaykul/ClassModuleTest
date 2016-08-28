ipmo "$PSScriptRoot\Scenario1.psd1" -Force

$Object = New-TestObject1
Get-TestObject1 -TestObject $Object
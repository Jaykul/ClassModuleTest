@{
    RootModule = 'Scenario4.psm1'
    ModuleVersion = '1.0'
    GUID = '7aaa084f-4e22-4b03-879d-168ba516bd29'
    Author = 'Matt McNabb'
    Copyright = '(c) 2016 . All rights reserved.'
    Description = 'A PowerShell module for demonstrating the issues with classes in v5.0.'
    PowerShellVersion = '5.0'
    FunctionsToExport = 'New-TestObject4','Get-TestObject4'
    NestedModules = "TestObject4\TestObject4.psd1"
}

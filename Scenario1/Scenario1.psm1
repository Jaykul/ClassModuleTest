. "$PSScriptRoot\TestObject1.ps1"

function New-TestObject1
{
    [CmdletBinding()]
    [OutputType([TestObject1])]
    param
    (
        [string]
        $Property1 = 'Value1',

        [string]
        $Property2 = 'Value2',

        $Id = 1234
    )

    [TestObject1]@{
        Property1 = $Property1
        Property2 = $Property2
        Id        = 1234
    }
}

function Get-TestObject1
{
    [CmdletBinding()]
    param
    (
        [TestObject1]
        $TestObject
    )

    $TestObject
}

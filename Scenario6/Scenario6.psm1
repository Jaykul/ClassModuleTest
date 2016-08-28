using module Scenario2

function New-TestObject6
{
    [CmdletBinding()]
    [OutputType([TestObject2])]
    param
    (
        [string]
        $Property1 = 'Value1',

        [string]
        $Property2 = 'Value2',

        $Id = 1234
    )

    [TestObject2]@{
        Property1 = $Property1
        Property2 = $Property2
        Id        = 1234
    }
}

function Get-TestObject6
{
    [CmdletBinding()]
    param
    (
        [TestObject2]
        $TestObject
    )

    $TestObject
}

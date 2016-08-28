using module TestObject5

function New-TestObject5
{
    [CmdletBinding()]
    [OutputType([TestObject5])]
    param
    (
        [string]
        $Property1 = 'Value1',

        [string]
        $Property2 = 'Value2',

        $Id = 1234
    )

    [TestObject5]@{
        Property1 = $Property1
        Property2 = $Property2
        Id        = 1234
    }
}

function Get-TestObject5
{
    [CmdletBinding()]
    param
    (
        [TestObject5]
        $TestObject
    )

    $TestObject
}

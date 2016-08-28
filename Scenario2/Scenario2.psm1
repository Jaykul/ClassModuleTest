class TestObject2
{
    [string] $Property1
    [string] $Property2
    [int]    $Id
}

function New-TestObject2
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

function Get-TestObject2
{
    [CmdletBinding()]
    param
    (
        [TestObject2]
        $TestObject
    )

    $TestObject
}

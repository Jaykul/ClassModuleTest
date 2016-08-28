function New-TestObject3
{
    [CmdletBinding()]
    [OutputType([TestObject3])]
    param
    (
        [string]
        $Property1 = 'Value1',

        [string]
        $Property2 = 'Value2',

        $Id = 1234
    )

    [TestObject3]@{
        Property1 = $Property1
        Property2 = $Property2
        Id        = 1234
    }
}

function Get-TestObject3
{
    [CmdletBinding()]
    param
    (
        [TestObject3]
        $TestObject
    )

    $TestObject
}

function New-TestObject4
{
    [CmdletBinding()]
    [OutputType([TestObject4])]
    param
    (
        [string]
        $Property1 = 'Value1',

        [string]
        $Property2 = 'Value2',

        $Id = 1234
    )

    [TestObject4]@{
        Property1 = $Property1
        Property2 = $Property2
        Id        = 1234
    }
}

function Get-TestObject4
{
    [CmdletBinding()]
    param
    (
        [TestObject4]
        $TestObject
    )

    $TestObject
}

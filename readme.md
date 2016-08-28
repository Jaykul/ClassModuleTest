# Using PowerShell v5.0 Classes in a Script Module
I've been working at building a PowerShell script module that leverages classes in an effort to learn the patterns of object-oriented development in PowerShell v5.0. I've run into several problems, however, that have left me doubting the practicality of using classes in their current state. This project will demonstrate several approaches I've taken and the problems I've encountered with each. This is not an attempt to provide a solution to those problems, but hopefully will open the discussion about improving the implementation of classes in the next version of PowerShell. Otherwise, consider this a vehicle to discuss the correct way to use classes in a module and to point out where I've gone wrong and what to expect with each approach. What is the "endorsed" way to do this?

For reference, the original project is [here](github.com/mattmcnabb/OneLogin).

## Project Details
This project contains 5 PowerShell modules, each demonstrating a different approach. A description of each approach and roadblocks with each is included below.

## Scenarios

### Scenario1
Define classes in separate script files and dot-source them in the psm1 file.

When the module is imported this error is returned:

```console
Unable to find type [TestObject1].
At C:\ClassModuleTest\Scenario1\Scenario1.psm1:6 char:17
+     [OutputType([TestObject1])]
+                 ~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (TestObject1:TypeName) [], RuntimeException
    + FullyQualifiedErrorId : TypeNotFound

Unable to find type [TestObject1].
At C:\ClassModuleTest\Scenario1\Scenario1.psm1:30 char:9
+         [TestObject1]
+         ~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (TestObject1:TypeName) [], RuntimeException
    + FullyQualifiedErrorId : TypeNotFound
```

### Scenario2
Define classes directly in the psm1 file

Need further testing as this seems to be working as expected. I'll test in the production module again and see what happens.

### Scenario3
Define classes in separate script files and add them to ScriptsToProcess

Seems to be working at a basic level in this project, but I had problems when I tried this in a production module. I test by using a simple debug script that imports the module and runs a few of the functions. I have a helper function that casts the custom object output from Invoke-RestMethod to a custom class type. It fails with this error:

```console
Cannot convert the "TestObject" value of type "System.String" to type "System.Type".
At .\ConvertTo-TestObject.ps1:19 char:13
+             $InputObject -as $TypeName
+             ~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (:) [], RuntimeException
    + FullyQualifiedErrorId : InvalidCastFromStringToType
```

This problem does not occur if I dot-source the debug script. This indicates that this may be caused by a class scoping issue.

### Scenario4
Define classes in a nested Module

Imports fine but when I run this command

```PowerShell
PS> New-TestObject4
```

I get this error

```console
Unable to find type [TestObject4].
At C:\ClassModuleTest\Scenario4\Scenario4.psm1:4 char:17
+     [OutputType([TestObject4])]
+                 ~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (TestObject4:TypeName) [], RuntimeException
    + FullyQualifiedErrorId : TypeNotFound
```

### Scenario5
Create a master module with both the working module and the classes module as nested modules

When I attempt to import the module

```console
At C:\ClassModuleTest\Scenario5\Scenario5Module\Scenario5Module.psm1:1 char:1
+ using module TestObject5
+ ~~~~~~~~~~~~~~~~~~~~~~~~
Could not find the module 'TestObject5'.
    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException
    + FullyQualifiedErrorId : ModuleNotFoundDuringParse

ipmo : The module to process 'Scenario5Module.psm1', listed in field 'ModuleToProcess/RootModule' of module manifest
'C:\ClassModuleTest\Scenario5\Scenario5Module\Scenario5Module.psd1' was not processed because no valid module was found in any module
directory.
At line:1 char:1
+ ipmo C:\ClassModuleTest\Scenario5 -Force
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ResourceUnavailable: (Scenario5Module:String) [Import-Module], PSInvalidOperationException
    + FullyQualifiedErrorId : Modules_ModuleFileNotFound,Microsoft.PowerShell.Commands.ImportModuleCommand
```
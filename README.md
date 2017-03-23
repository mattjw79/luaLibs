# luaLibs
Custom Lua libraries that I find useful

### customtype.lua
Allows the use of an internal attribute, __type, on custom
class definitions and extents the builtin type() function to take
advantage of the internal attribute.

### emailaddress.lua
Class for splitting an email address into proper parts.

### ipv4address.lua
Class for breaking down a CIDR address and converting/presenting
binary equivalent.

### stringaddons.lua
Extensions for the builtin string class. Adds the following methods:
* split - splits string on delimiter and returns a table with the parts
* rstrip - strips off right-hand whitespace
* lstrip - strips off left-hand whitespace
* strip - strips off right-hand and left-hand whitespace
* startswith - checks if a string starts with a specified string
* endswith - checks if a string ends with a specified string
* contains - checks if a string contains a specified string

### tableaddons.lua
Extensions for the builtin table class. Adds the following methods:
* count - counts both indexed and named attributes
* slice - returns a slice of a table with specified start index and
          number of elements the slice should contain

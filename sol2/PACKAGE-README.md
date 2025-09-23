# sol2 - C++ Library Binding to Lua

This is the `build2` package for the sol2 library.
sol2 is a C++ library binding to Lua that aims to be easy to use and easy to add to a project.

## Usage
To use `sol2` in your project, add the following configurations to the respective files after you have gained access to a `build2` package repository that contains it.

### `manifest`
To make `sol2` available for import, add the following dependency to the `manifest` of each package in your project that requires it, adjusting the version constraint as appropriate.

    depends: sol2 ^3.5.0

### `buildfile`
To import the contained library, use the following declaration in your `buildfile`.

    import sol2 = sol2%lib{sol2}

For maximum safety and consistency, define the `SOL_ALL_SAFETIES_ON` macro for any target that uses sol2.
This ensures all source files are compiled with the library's built-in safety checks enabled.

    cxx.poptions += -DSOL_ALL_SAFETIES_ON=1

### C++ Header Inclusion
Finally, include the necessary sol2 headers in your C++ source code.
If you configured the safety macro in your buildfile as recommended, no other steps are needed.
Otherwise, you should define the `SOL_ALL_SAFETIES_ON` macro manually before the include directive.

```c++
// The following line is only necessary if SOL_ALL_SAFETIES_ON
// was not defined in your project's buildfile already.
#define SOL_ALL_SAFETIES_ON 1
#include <sol/sol.hpp>
```

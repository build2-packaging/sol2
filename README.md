# build2 Package for Sol2/3

This project is a [build2](https://build2.org) package repository that provides access to [Sol2/3](https://github.com/ThePhD/sol2), a C++ library binding to Lua.

[![Official](https://img.shields.io/website/https/github.com/ThePhD/sol2.svg?down_message=offline&label=Official&style=for-the-badge&up_color=blue&up_message=online)](https://github.com/ThePhD/sol2)
[![build2](https://img.shields.io/website/https/github.com/build2-packaging/sol2.svg?down_message=offline&label=build2&style=for-the-badge&up_color=blue&up_message=online)](https://github.com/build2-packaging/sol2)
[![cppget.org](https://img.shields.io/website/https/cppget.org/sol2.svg?down_message=offline&label=cppget.org&style=for-the-badge&up_color=blue&up_message=online)](https://cppget.org/sol2)
[![queue.cppget.org](https://img.shields.io/website/https/queue.cppget.org/sol2.svg?down_message=empty&down_color=blue&label=queue.cppget.org&style=for-the-badge&up_color=orange&up_message=running)](https://queue.cppget.org/sol2)

## Usage
Make sure to add the stable section of the `cppget.org` repository to your project's `repositories.manifest` to be able to fetch the package.

    :
    role: prerequisite
    location: https://pkg.cppget.org/1/stable
    # trust: ...

If the stable section of `cppget.org` is not an option then add this Git repository itself instead as a prerequisite.

    :
    role: prerequisite
    location: https://github.com/build2-packaging/sol2.git

Add the respective dependency in your project's `manifest` file to make the package available for import.

    depends: sol2 ^3.3.1

Then use the following line in your `buildfile` to import the library.

    import sol2 = sol2%lib{sol2}

## Configuration
There are no configuration options available.

## Issues and Notes
- So far, preprocessor directives are not provided as configuration variables to allow for dependency negotiation and API/API-compatible builds. Consistent library configuration across multiple packages must be ensured by the consumer itself.
- The `sol2-tests` package is currently provided as an independent test package that depends on `sol2` to reduce false-negative compilation results. The tests require the Catch2 library which currently doesn't build with Clang.
- The `sol2-examples` package that compiles and runs the basic examples from sol2's documentation and tutorials is declared as an example package of `sol2` and is also used for testing. While it does not require any other dependencies, it still is provided as an external package to reduce the size of the overall `sol2` package archive.
- Currently, upstream omits the run time tests directory as these are not working. For the next release, check whether these tests are enabled again.
- So far, examples in `customization` and `interop` are not included in the `sol2-examples` package.
- According to [sol2/issues/1581](https://github.com/ThePhD/sol2/issues/1581), a bug in Clang 18 prevents the tests and examples from being successfully compiled in Clang-based target configurations. The issue's workaround has been applied to `sol/function_types_stateless.hpp` with the original file located at `sol/function_types_stateless.hpp.orig`. A future release of Clang or Sol2 may fix this issue.
- Sol2 also supports LuaJIT. However, LuaJIT is currently not offered as a build2 package by `cppget.org` and, as a consequence, cannot be used with this package.

## Contributing
Thank you in advance for your help and contribution to keep this package up-to-date.
Please, file an issue on [GitHub](https://github.com/build2-packaging/sol2/issues) for questions, bug reports, or to recommend updating the package version.
If you're making a pull request to fix bugs or update the package version yourself, refer to the [`build2` Packaging Guidelines](https://build2.org/build2-toolchain/doc/build2-toolchain-packaging.xhtml#core-version-management).

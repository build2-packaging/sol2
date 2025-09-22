# build2 Package Repository for sol2

This is a [build2](https://build2.org) package repository for [sol2](https://github.com/ThePhD/sol2), a modern C++ wrapper that enables easy and safe interaction with the Lua C API.

This repository is a community-maintained effort and is not officially endorsed by the sol2 authors.

| Package | Summary | Status |
|---|---|---|
| **[`sol2`](sol2/PACKAGE-README.md)** | C++ Library Binding to Lua | [![cppget.org](https://img.shields.io/website/https/cppget.org/sol2.svg?down_message=offline&label=cppget.org&style=for-the-badge&up_color=blue&up_message=online)](https://cppget.org/sol2) [![queue.cppget.org](https://img.shields.io/website/https/queue.cppget.org/sol2.svg?down_message=empty&down_color=blue&label=queue.cppget.org&style=for-the-badge&up_color=orange&up_message=running)](https://queue.cppget.org/sol2) |

## Usage
If you want to use the `sol2` package in your `build2`-based project, add an appropriate repository manifest to your project's `repositories.manifest` and refer to [`sol2`'s PACKAGE README](sol2/PACKAGE-README.md).

### `repositories.manifest`
To be able to fetch the package, add one of the following prerequisites to your project's `repositories.manifest`.

**Option A: `cppget.org` (Recommended)**

Based on your project's stability requirements, choose either the [`stable` section](https://cppget.org/?about#pkg%3Acppget.org%2Fstable) for thoroughly tested versions or the [`testing` section](https://cppget.org/?about#pkg%3Acppget.org%2Ftesting) for the latest releases before they are marked as stable.
For example:

    :
    role: prerequisite
    location: https://pkg.cppget.org/1/stable
    # trust: ...

**Option B: Git Repository**

    :
    role: prerequisite
    location: https://github.com/build2-packaging/sol2.git

## Development Setup
The development setup for this repository uses the standard `bdep`-based workflow.
For general information and guidance on package maintenance, please see the [`build2` Documentation](https://build2.org/doc.xhtml).

First, clone the repository via SSH or HTTPS.

    git clone --recurse https://github.com/build2-packaging/sol2.git  # HTTPS
    git clone --recurse git@github.com:build2-packaging/sol2.git      # SSH

Inside the repository's directory, initialize your build configuration.

    bdep init -C @gcc cc config.cxx=g++ config.install.root=../.install config.dist.root=../.dist

Afterwards, use `b` or `bdep` to build, test, install, and distribute the packages.

## Issues and Notes
- This package repository uses directory-level symlinks to the upstream source files, rather than linking to each file individually. While this approach seemingly simplifies package updates, it significantly increases the complexity of the `buildfile` logic. This structure was introduced during a past version update and has been retained to avoid further disruptive changes to the build system. Note that any changes to the directory symlinks must also be updated in `.gitignore` and `.gitattributes`.
- `sol2` is a header-only library, but its behavior can be modified with preprocessor directives. These are not exposed as `build2` configuration variables, so consumers are responsible for ensuring a consistent configuration if multiple packages in a project depend on `sol2`.
- Upstream `sol2` provides a single-header version of the library for convenient manual integration. This package intentionally uses the original multi-file source structure, as the primary benefit of a single header is made redundant by `build2`'s package and dependency management.
- The `run_time` and `utility` tests are not included in the `sol2-tests` package. According to upstream's `CMakeLists.txt`, enabling the `run_time` tests requires including a set of known-broken tests. The `utility` tests are therefore also excluded due to their dependency on the `run_time` test sources.
- The `sol2-examples` package is provided separately from the main `sol2` package to reduce the overall archive size. It serves as both an example and a test case.
- This package does not currently support LuaJIT, as a `build2` package for it is not yet available in the public `cppget.org` repository.
- Examples from the upstream `customization` and `interop` directories are not yet included in the `sol2-examples` package.
- A bug in Clang 18 prevents the tests and examples from compiling successfully. A workaround from [sol2/issues/1581](https://github.com/ThePhD/sol2/issues/1581) has been applied to `sol/function_types_stateless.hpp`, with the original file preserved as `sol/function_types_stateless.hpp.orig`. This bug is fixed in recent Clang versions. Remove this patch once CI provides newer Clang builds.
- When using the Clang/MSVC toolchain on Windows, the `numeric` test fails by abnormal termination. This suggests a potential incompatibility between sol2 and this specific compiler toolchain.

## Contributing
Contributions are welcome and greatly appreciated!
Please start by [opening an issue](https://github.com/build2-packaging/sol2/issues) to report a bug, suggest an improvement, or request a version update.
This helps us coordinate efforts and avoid duplicate work.
You are then welcome to submit a [pull request](https://github.com/build2-packaging/sol2/pulls) that references the issue.
For guidance on package maintenance, please see the [`build2` Packaging Guidelines](https://build2.org/build2-toolchain/doc/build2-toolchain-packaging.xhtml).

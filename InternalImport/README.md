# Demonstrate `internal import` with `private_deps`

In ModuleB, we have `internal import ModuleA`, if we change `deps` to `private_deps` on `//ModuleB:ModuleB`, `bazel build //ModuleC:ModuleC` will fail.

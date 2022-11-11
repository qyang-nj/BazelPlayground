# Issue0

This is sample code to reproduce a bug in `rules_ios` -- when using `apple_framework`, the transitive framework import causes release build fail.

## Repro Steps
1. Check the repro and `cd Issue0`.
2. `bazel build //:Module2 --compilation_mode=dbg`. This builds successfully.
3. `bazel build //:Module2 --compilation_mode=opt`. This fails with following error message.
```
error: emit-module command failed with exit code 1 (use -v to see invocation)
Module2/Source2.swift:1:8: error: missing required module 'PPRiskMagnes'
import Module1
       ^
```

The same build error will happen if we use `--features=swift.cacheable_swiftmodules`.

## Investigation
With either `--compilation_mode=dbg` or `--features=swift.cacheable_swiftmodules`, `swift_library` will stop passing `-serialize-debugging-options` to swiftc. Unfortunately, it seems we are relying on the search paths embedded in `.swiftmodule` for transitive framework imports. We should explicitly provide the search paths to swiftc.

## Fix
[This change](https://github.com/qyang-nj/rules_ios/pull/3) addresses this problem.

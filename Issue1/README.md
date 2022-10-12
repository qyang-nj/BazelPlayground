# Issue1
This is sample code to reproduce a bug in `rules_ios` -- when enabling `--features=apple.virtualize_frameworks`, the `includes` field of `objc_library` won't be propagated to the transitive reverse `apple_framework` deps.

## Repro Steps
1. Check out the repro and `cd Issue1`.
2. `bazel build //:Framework2 -s`. Check the Swift compiler flags for Framework2 (should be a file called `Framework2.swiftmodule-0.params`), we see `-Xcc -IHeader1 -Xcc -IHeader2`.
3. `bazel build //:Framework2 -s --features=apple.virtualize_frameworks`. Check the Swift compiler flags again, we do **not** see `-IHearder1` or `-IHeader2`.

## Investigation
The `includes` field of `objc_library` should be propagated to all the reverse deps. This is true when the deps are `objc_library`, `swift_library`, `apple_framework` without `virtualize_frameworks`, but it's not true for `apple_framework` with `virtualize_frameworks`.

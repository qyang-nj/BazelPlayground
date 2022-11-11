# Bazel Playground
A playground for Bazel iOS builds.

## Issues
Here are the issues I found when learning/using Bazel.

* [rules_ios] [When using `apple_framework`, the transitive framework import causes release build fail.](./Issue0/)
* [rules_ios] [When enabling `--features=apple.virtualize_frameworks`, the `includes` field of `objc_library` won't be propagated to the transitive reverse `apple_framework` deps.](./Issue1/)
* [rules_ios] [The `framework_includes` field of `CcInfo.compilation_context` in `apple_framework` won't be propagated, causing flaky builds with remote cache enabled.](./Issue2/)

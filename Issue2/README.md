# Issue2
This is sample code to demonstrate an issue in `rules_ios` -- the `framework_includes` field of `CcInfo.compilation_context` won't be propagated to the transitive reverse `apple_framework` deps.

In the following example, the `CcInfo.compilation_context.framework_includes` of `//:Bar` (a transitive dependency of the prebuilt frameworks) doesn't have `["FBSDKCoreKit/iOS", "FBSDKCoreKit/iOS/FBSDKCoreKit"]`, while `//:Foo` (a direct dependency of the prebuilt frameworks) does. This causes an issue that if `//:Foo` is a cache it, building `//:Bar` while run into an error complaining a header file is missing.

```
apple_static_framework_import(
    name = "FBSDKCoreKit",
    framework_imports = glob(["FBSDKCoreKit/iOS/FBSDKCoreKit.framework/**"]),
)

apple_static_framework_import(
    name = "FBSDKLoginKit",
    framework_imports = glob(["FBSDKLoginKit/iOS/FBSDKLoginKit.framework/**"]),
    deps = [":FBSDKCoreKit"]
)

apple_framework(
    name = "Foo,
    deps = [":FBSDKLoginKit"],
    ...
)

apple_framework(
    name = "Bar",
    deps = [":Foo"],
    ...
)
```
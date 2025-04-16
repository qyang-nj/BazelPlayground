# Missing symbols when building `ios_framework` with `--compilation_mode=dbg`

## Repro Steps
1. `bazel build //:iOSApplication --compilation_mode=dbg`, the build is successful
2. `bazel build //:iOSApplication --compilation_mode=opt`, the build fails with the following linker error
```
Undefined symbols for architecture arm64:
  "FrameworkLibrary.Foo.(foo in _A348D778866A3C17181E8782A21160A7).modify : Swift.String?", referenced from:
      full type metadata for AppLibrary.FooSubclass in libAppLibrary.a[2](App.swift.o)
  "FrameworkLibrary.Foo.(foo in _A348D778866A3C17181E8782A21160A7).getter : Swift.String?", referenced from:
      full type metadata for AppLibrary.FooSubclass in libAppLibrary.a[2](App.swift.o)
  "FrameworkLibrary.Foo.(foo in _A348D778866A3C17181E8782A21160A7).setter : Swift.String?", referenced from:
      full type metadata for AppLibrary.FooSubclass in libAppLibrary.a[2](App.swift.o)
ld: symbol(s) not found for architecture arm64
```

## Investigation
The missing symbol is due to the `-dead_strip` linker flag, which Bazel automatically adds when `--compilation_mode=opt` is used. It appears there’s no way to prevent Bazel from passing `-dead_strip` to the linker under release build.

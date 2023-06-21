#!/bin/zsh

bazel build //:SampleApp

bazel test //Libraries/ASwiftModule:ASwiftModuleTests

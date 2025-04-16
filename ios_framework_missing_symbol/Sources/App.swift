import FrameworkLibrary
import SwiftUI

class FooSubclass: Foo {
  override init(foo: String) {
    super.init(foo: foo)
  }
}

@main
struct SimpleApp: App {
    var body: some Scene {
        WindowGroup {
            Text("Hello, world!")
        }
    }
}

import SwiftUI

// Internal libraries
import ASwiftModule
import SecondSwiftModule

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            Text("Hello, Bazel!")
            .padding()
            .background(Color.green.opacity(0.3))
        }
    }
}

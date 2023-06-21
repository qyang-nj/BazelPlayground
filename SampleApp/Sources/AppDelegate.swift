import UIKit

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {

  var window: UIWindow?

  let text = "This is an internal property in the app delegate!"

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey : Any]?
  ) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()

    return true
  }
}

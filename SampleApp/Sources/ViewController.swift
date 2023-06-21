import UIKit

// Internal libraries
import ASwiftModule
import SecondSwiftModule

public let testVar = "SampleValue"

class ViewController: UIViewController {

  let value = "ViewName"

  override func viewDidLoad() {
    super.viewDidLoad()

    let view = UIView()
    view.frame = self.view.frame
    view.backgroundColor = .green
    self.view = view

    let label = UILabel()
    label.text = "Hello, world"
    self.view.addSubview(label)
    label.sizeToFit()
    label.center = self.view.center

    let buildTypeLabel = UILabel()
    buildTypeLabel.text = "Hello, SampleApp"
    self.view.addSubview(buildTypeLabel)
    buildTypeLabel.sizeToFit()
    buildTypeLabel.center = CGPoint(x: self.view.center.x, y: self.view.frame.size.height - 50)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
}

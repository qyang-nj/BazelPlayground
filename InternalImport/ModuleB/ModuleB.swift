internal import ModuleA

public class B {
    public init() {
    }

    private let a = A()

    public func methodB() {
        a.methodA()
        print("Method B")
    }
}

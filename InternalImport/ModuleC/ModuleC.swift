internal import ModuleB

public class C {
    public init() {
    }

    public func methodC() {
        let b = B()
        b.methodB()
        print("Method C")
    }
}

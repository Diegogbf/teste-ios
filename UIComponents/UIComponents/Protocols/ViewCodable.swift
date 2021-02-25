import Foundation

public protocol ViewCodable: AnyObject {
    func buildHierarchy()
    func buildConstraints()
    func additionalSetup()
    func buildViewCode()
}

public extension ViewCodable {

    func buildViewCode() {
        buildHierarchy()
        buildConstraints()
        additionalSetup()
    }

    func additionalSetup() { }
}

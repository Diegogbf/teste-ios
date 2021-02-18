import UIKit

public final class DividerView: UIView {

    // MARK: - Initializers

    public init() {
        super.init(frame: .zero)

        buildViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        buildViewCode()
    }
}

// MARK: - ViewCodable

extension DividerView: ViewCodable {

    public func buildHierarchy() {}

    public func buildConstraints() {

        heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    }

    public func additionalSetup() {

        backgroundColor = .lightGray
    }
}

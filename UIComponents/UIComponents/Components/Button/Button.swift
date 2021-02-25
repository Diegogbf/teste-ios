import UIKit

public final class Button: UIButton {

    // MARK: - Private properties

    private lazy var heightConstraint = heightAnchor.constraint(equalToConstant: 44.0)

    // MARK: - Public properties

    public var isLoading = false {
        didSet {
            isLoading ? showLoading() : hideLoading()
        }
    }

    // MARK: - Initializers

    public init() {
        super.init(frame: .zero)

        buildViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        buildViewCode()
    }

    // MARK: - Overrides

    public override func layoutSubviews() {
        super.layoutSubviews()

        setupCornerRadius()
    }

    public override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .systemPurple : .lightGray
            isUserInteractionEnabled = isEnabled
        }
    }
}

// MARK: - Public methods

extension Button {

    public func showLoading() {

        isUserInteractionEnabled = false
        titleLabel?.layer.opacity = 0.0
        let activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.startAnimating()
    }

    public func hideLoading() {
        guard let activityIndicator = subviews.last as? UIActivityIndicatorView else { return }

        isUserInteractionEnabled = true
        activityIndicator.removeFromSuperview()
        titleLabel?.layer.opacity = 1.0
    }
}

// MARK: - ViewCodable

extension Button: ViewCodable {

    public func buildHierarchy() {}

    public func buildConstraints() {

        heightConstraint.isActive = true
    }

    public func additionalSetup() {

        backgroundColor = .systemPurple
        setTitleColor(.white, for: .normal)
    }
}

// MARK: - Private methods - Setup

extension Button {

    private func setupCornerRadius() {

        layer.cornerRadius = heightConstraint.constant / 2
    }
}

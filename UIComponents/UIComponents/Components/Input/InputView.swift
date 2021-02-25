import UIKit

public class InputView: UIView {

    // MARK: - Private properties

    private let stackView = UIStackView()
    private let titleLabel = Label(textStyle: .callout, textColor: .lightGray)
    private let textfield = UITextField()
    private let dividerView = DividerView()
    private let tapGesture = UITapGestureRecognizer()

    // MARK: - Public properties

    @IBInspectable
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    @IBInspectable
    var placeholder: String? {
        didSet {
            textfield.placeholder = placeholder
        }
    }

    @IBInspectable
    var text: String? {
        didSet {
            textfield.text = text
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
}

// MARK: - ViewCodable

extension InputView: ViewCodable {

    public func buildHierarchy() {

        addSubview(stackView)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textfield)
        stackView.addArrangedSubview(dividerView)
    }

    public func buildConstraints() {

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        dividerView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }

    public func additionalSetup() {

        setupTapGesture()
        setupStackView()
        setupTextField()
    }
}

// MARK: - Private methods - Setup

extension InputView {

    private func setupTapGesture() {

        tapGesture.addTarget(self, action: #selector(textfield.becomeFirstResponder))
        addGestureRecognizer(tapGesture)
    }

    private func setupStackView() {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
    }

    private func setupTextField() {

        textfield.textAlignment = .center
        textfield.textColor = .darkGray
        textfield.font = .preferredFont(forTextStyle: .title1)
        textfield.autocorrectionType = .no
    }
}

import UIKit

public class InputView: UIView {

    public enum InputType {
        case currency
        case date
        case percentage
        case `default`

        var maxNumberOfChars: Int {
            switch self {
            case .currency:
                return 16
            case .percentage:
                return 4
            default:
                return 100
            }
        }
    }

    // MARK: - Private properties

    private let stackView = UIStackView()
    private let titleLabel = Label(textStyle: .callout, textColor: .lightGray, numberOfLines: 1)
    private let textfield = UITextField()
    private let dividerView = DividerView()
    private let tapGesture = UITapGestureRecognizer()
    private let inputType: InputType

    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        datePicker.locale = .current
        datePicker.backgroundColor = .white
        return datePicker
    }()

    // MARK: - Public properties

    @IBInspectable
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    @IBInspectable
    public var placeholder: String? {
        didSet {
            textfield.placeholder = placeholder
        }
    }

    @IBInspectable
    public var text: String? {
        didSet {
            textfield.text = text
        }
    }

    // MARK: - Initializers

    public init(inputType: InputType = .default) {
        self.inputType = inputType
        super.init(frame: .zero)
        buildViewCode()

        switch inputType {
        case .currency, .percentage:
            textfield.keyboardType = .numberPad
        case .date:
            textfield.inputView = datePicker
        default:
            break
        }
    }

    required init?(coder: NSCoder) {
        self.inputType = .default
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
    }

    public func additionalSetup() {
        titleLabel.minimumScaleFactor = 0.6
        titleLabel.adjustsFontSizeToFitWidth = true

        setupTapGesture()
        setupStackView()
        setupTextField()
    }
}

// MARK: - Private methods - Setup

extension InputView {

    private func setupTapGesture() {

        tapGesture.addTarget(self, action: #selector(textfield.becomeFirstResponder))
        textfield.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        textfield.delegate = self
        addGestureRecognizer(tapGesture)
    }

    private func setupStackView() {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16.0
        stackView.distribution = .equalSpacing
    }

    private func setupTextField() {

        textfield.textAlignment = .center
        textfield.textColor = .darkGray
        textfield.font = .preferredFont(forTextStyle: .title1)
        textfield.autocorrectionType = .no
    }

    @objc private func datePickerChanged(_ picker: UIDatePicker) {
        textfield.text = picker.date.formatted("dd/MM/yyyy")
    }

    @objc private func textChanged(_ textField: UITextField) {
        let text = textfield.text ?? ""

        switch inputType {
        case .currency:
            textfield.text = text.currencyFormatted
        case .percentage:
            textfield.text = "\(text)"
        default:
            break
        }
    }
}

extension InputView: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        (textField.text?.count ?? 0) < inputType.maxNumberOfChars || string.isEmpty
    }
}

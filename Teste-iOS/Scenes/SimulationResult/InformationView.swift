//
//  InformationView.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 09/04/21.
//

import UIKit
import UIComponents

class InformationView: UIStackView {

    struct Data {
        let placeholder: String
        let value: String
    }

    // MARK: - Properties

    private let placeholderLabel = Label(textStyle: .footnote, textColor: .lightGray, textAlignment: .left)
    private let valueLabel = Label(textStyle: .footnote, textColor: .black, numberOfLines: 1, textAlignment: .right)

    // MARK: - Initializer

    init(data: Data) {
        super.init(frame: .zero)
        placeholderLabel.text = data.placeholder
        valueLabel.text = data.value
        buildViewCode()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodable

extension InformationView: ViewCodable {
    func buildHierarchy() {
        [placeholderLabel, valueLabel].forEach { addArrangedSubview($0) }
    }

    func buildConstraints() {}

    func additionalSetup() {
        axis = .horizontal
        valueLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}

//
//  SimulationResultView.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import UIKit
import UIComponents

class SimulationResultView: UIView {

    // MARK: - Properties

    let titleLabel = Label(textStyle: .callout, textColor: .lightGray)
    let valueLabel = Label(textStyle: .title1, textColor: .black)
    let profitLabel = Label(textStyle: .callout, textColor: .lightGray)
    let simulateAgainButton = Button()
    let informationStackView = UIStackView()
    lazy var titleStackView = buildTitleStackView()

    // MARK: - Initializer

    init() {
        super.init(frame: .zero)
        buildViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setInformationData(data: [InformationView.Data]) {
        data.forEach { informationStackView.addArrangedSubview(InformationView(data: $0)) }
    }
}

// MARK: - ViewCodable

extension SimulationResultView: ViewCodable {
    func buildHierarchy() {
        [titleStackView, informationStackView, simulateAgainButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        [titleLabel, valueLabel, profitLabel].forEach { titleStackView.addArrangedSubview($0) }
     }

    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            titleStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            informationStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            informationStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            informationStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 24),
            informationStackView.bottomAnchor.constraint(
                lessThanOrEqualTo: simulateAgainButton.topAnchor,
                constant: -24
            )
        ])

        NSLayoutConstraint.activate([
            simulateAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            simulateAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            simulateAgainButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }

    func additionalSetup() {
        titleLabel.text = .localize(for: "simulation.result.title")
        simulateAgainButton.setTitle(.localize(for: "simulation.result.simulate.again.buttn.title"), for: .normal)
        informationStackView.axis = .vertical
        titleStackView.spacing = 8
        informationStackView.spacing = 12
        backgroundColor = .white
    }
}

// MARK: - BuildViews

extension SimulationResultView {
    func buildTitleStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }
}

class InformationView: UIStackView {

    struct Data {
        let placeholder: String
        let value: String
    }

    // MARK: - Properties

    private let placeholderLabel = Label(textStyle: .callout, textColor: .lightGray, textAlignment: .left)
    private let valueLabel = Label(textStyle: .callout, textColor: .black, numberOfLines: 1, textAlignment: .right)

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

//
//  SimulationView.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 04/04/21.
//

import UIKit
import UIComponents

class SimulationView: UIView {

    // MARK: - Properties

    private lazy var scrollView = buildScrollView()
    private lazy var contentStackView = buildContentStackView()
    private lazy var scrollContentView = buildScrollContentView()
    private(set) lazy var simulateButton = buildButton()
    private(set) lazy var investedValueInput = buildInput(
        title: .localize(for: "simulation.value.field.title"),
        placeholder: .localize(for: .localize(for: "simulation.value.field.placeholder")),
        type: .currency
    )
    private(set) lazy var expirationDateInput = buildInput(
        title: .localize(for: "simulation.expiration.date.field.title"),
        placeholder: .localize(for: "simulation.expiration.date.field.placeholder"),
        type: .date
    )
    private(set) lazy var CDIRateInput = buildInput(
        title: .localize(for: "simulation.cdi.field.title"),
        placeholder: .localize(for: "simulation.cdi.field.placeholder"),
        type: .percentage
    )

    init() {
        super.init(frame: .zero)
        buildViewCode()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - ViewCodable

extension SimulationView: ViewCodable {
    func buildHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContentView)

        contentStackView.addArrangedSubview(investedValueInput)
        contentStackView.addArrangedSubview(expirationDateInput)
        contentStackView.addArrangedSubview(CDIRateInput)
        contentStackView.addArrangedSubview(simulateButton)
        scrollContentView.addSubview(contentStackView)
    }

    func buildConstraints() {
        scrollView.pinToSuperView()
        scrollContentView.pinToSuperView()

        let scrollContentHeightConstraint = scrollContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        scrollContentHeightConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            scrollContentHeightConstraint,
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        contentStackView.pinToSuperView(constant: 24)
    }

    func additionalSetup() {
        backgroundColor = .white
    }
}

// MARK: - Build views

extension SimulationView {
    private func buildContentStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }

    private func buildScrollContentView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    private func buildScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    private func buildInput(title: String, placeholder: String, type: InputView.InputType) -> InputView {
        let inputView = InputView(inputType: type)
        inputView.title = title
        inputView.placeholder = placeholder
        return inputView
    }

    private func buildButton() -> Button {
        let button = Button()
        button.setTitle(.localize(for: "simulation.simulate.button.title"), for: .normal)
        return button
    }
}

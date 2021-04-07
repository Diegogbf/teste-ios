//
//  SimulationResultViewController.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import UIKit

class SimulationResultViewController: CustomViewController<SimulationResultView> {

    // MARK: - Properties

    private var viewModel: SimulationResultViewModelProtocol

    required init(viewModel: SimulationResultViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setups

extension SimulationResultViewController {
    func setup() {
        setupButtons()
        setupViews()
    }

    func setupButtons() {
        contentView.simulateAgainButton.addTarget(self, action: #selector(simulateAgainTapped), for: .touchUpInside)
    }

    func setupViews() {
        contentView.titleLabel.text = viewModel.title
        contentView.valueLabel.text = viewModel.amount
        contentView.profitLabel.text = viewModel.profitText
        contentView.setInformationData(data: viewModel.informationData)
    }
}

// MARK: - Actions

extension SimulationResultViewController {
    @objc private func simulateAgainTapped() {
        viewModel.simulateAgainTapped()
    }
}

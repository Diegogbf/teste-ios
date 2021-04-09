//
//  SimulationResultCoordinator.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 07/04/21.
//

import UIKit

class SimulationResultCoordinator {

    // MARK: - Properties

    private let navigationController: UINavigationController

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(with result: SimulationResultDataModel) {
        let viewModel = SimulationResultViewModel(simulationResult: result, coordinatorDelegate: self)
        let controller = SimulationResultViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - SimulationViewModelCoordinatorProtocol

extension SimulationResultCoordinator: SimulationResultViewModelCoordinatorProtocol {
    func simulateAgain() {
        navigationController.popViewController(animated: true)
    }
}

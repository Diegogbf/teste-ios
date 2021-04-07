//
//  MainCoordinator.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import UIKit

class MainCoordinator {

    // MARK: - Properties

    let window: UIWindow
    let navigationController = UINavigationController()

    // MARK: - Initializer

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
    }

    func start() {
        startSimulation()
    }

    private func startSimulation() {
        let coordinator = SimulationCoordinator(delegate: self, navigationController: navigationController)
        coordinator.start()
    }
}

extension MainCoordinator: SimulationCoordinatorProtocol {
    func showSimulationResult(result: SimulationResultDataModel) {
        let coordinator = SimulationResultCoordinator(navigationController: navigationController)
        coordinator.start(with: result)
    }
}

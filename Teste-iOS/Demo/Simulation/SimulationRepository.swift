//
//  SimulationRepository.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 06/04/21.
//

import Foundation

protocol SimulationRepositoryFactory {
    func simulate(
        data: SimulationDataModel,
        onSuccess: @escaping ((SimulationResultDataModel) -> Void),
        onError: @escaping ((String) -> Void)
    )
}

class SimulationRepository: SimulationRepositoryFactory {
    func simulate(
        data: SimulationDataModel,
        onSuccess: @escaping ((SimulationResultDataModel) -> Void),
        onError: @escaping ((String) -> Void)
    ) {
        ServiceLayer.request(
            route: Router.simulate(data: data),
            onSuccess: { (response: SimulationResultDataModel) in
                onSuccess(response)
            },
            onError: { errorMsg in
                onError(errorMsg)
            }
        )
    }
}

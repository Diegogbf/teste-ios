//
//  Router.swift
//  base-ios
//
//  Created by Diego Gomes on 20/01/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//
//
import Foundation

enum Router {
    case simulate(data: SimulationDataModel)
}

extension Router: EndPointType {
    var baseURL: URL {
        return URL(string: apiURL)!
    }

    var path: String {
        switch self {
        case .simulate:
            return EndPoint.simulate.rawValue
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .simulate:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .simulate(let data):
            return .requestParameters(bodyParameters: nil, urlParameters: data.dictionary)
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}

//
//  MockNetworkManager.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import Foundation
@testable import AssessmentCore
@testable import AssessmentHome

class MockNetworkManager: NetworkManagerProtocol {
    var movieApiResponse: MovieApiResponse?

    func request<T: Decodable>(request: NetworkRequestProtocol, responseType: T.Type) async throws -> T {
        if let movieApiResponse = movieApiResponse as? T {
            return movieApiResponse
        } else {
            throw NetworkError.badRequest
        }
    }
}

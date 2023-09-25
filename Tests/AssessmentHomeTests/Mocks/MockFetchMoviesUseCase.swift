//
//  MockFetchMoviesUseCase.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import Foundation
@testable import AssessmentHome

class MockFetchMoviesUseCase: FetchMoviesUseCaseProtocol {
    var result: Result<[Movie], Error>?

    func execute() async throws -> [Movie] {
        switch result {
        case .success(let movies):
            return movies
        case .failure(let error):
            throw error
        case .none:
            fatalError("Result not set in MockFetchMoviesUseCase")
        }
    }
}

enum MockFetchMoviesUseCaseError: Error {
    case fetchMoviesError
}

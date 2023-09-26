//
//  MockMovieService.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import Foundation
@testable import AssessmentHome

class MockMovieService: MovieServiceProtocol {
    var movieDataList: [MovieData] = []

    func fetchMoviesFromNetwork() async throws -> [MovieData] {
        return movieDataList
    }
}

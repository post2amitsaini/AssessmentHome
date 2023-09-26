//
//  MockMovieRepository.swift
//  
//
//  Created by Amit Saini on 26/09/23.
//

import Foundation
@testable import AssessmentHome

class MockMovieRepository: MovieRepositoryProtocol {
    var movies: [Movie] = []

    func fetchMovies() async throws -> [Movie] {
        return movies
    }
}

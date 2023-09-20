//
//  FetchMoviesUseCase.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

class FetchMoviesUseCase: FetchMoviesUseCaseProtocol {
    let movieRepository: MovieRepositoryProtocol

    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }

    func execute() async throws -> [Movie] {
        return try await movieRepository.fetchMovies()
    }
}

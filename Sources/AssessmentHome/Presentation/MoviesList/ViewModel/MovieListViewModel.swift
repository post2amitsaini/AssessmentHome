//
//  File.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import Foundation
import Combine
import AssessmentCore

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let fetchMoviesUseCase: FetchMoviesUseCaseProtocol

    init(fetchMoviesUseCase: FetchMoviesUseCaseProtocol = FetchMoviesUseCase(movieRepository: MovieRepository(service: MovieService(networkManager: NetworkManager())))) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }

    func fetchMovies() async {
        do {
            let fetchedMovies = try await fetchMoviesUseCase.execute()
            DispatchQueue.main.async {
                self.movies = fetchedMovies
            }
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}

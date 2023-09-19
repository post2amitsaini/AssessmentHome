//
//  File.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let fetchMoviesUseCase: FetchMoviesUseCase

    init(fetchMoviesUseCase: FetchMoviesUseCase = FetchMoviesUseCase(movieRepository: MovieRepository())) {
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

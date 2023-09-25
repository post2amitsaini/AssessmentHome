//
//  MovieRepository.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

class MovieRepository: MovieRepositoryProtocol {
    private let service: MovieServiceProtocol
    init(service: MovieServiceProtocol) {
        self.service = service
    }
    
    func fetchMovies() async throws -> [Movie] {
        let movieDataList = try await service.fetchMoviesFromNetwork()
        let movies = movieDataList.map { movieData in
            Movie(
                title: movieData.title,
                genre: "Unknown",
                description: movieData.overview,
                imageName: movieData.poster_path,
                releaseDate: movieData.release_date
            )
        }
        return movies
    }
}

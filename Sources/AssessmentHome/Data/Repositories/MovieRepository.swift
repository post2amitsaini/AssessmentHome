//
//  MovieRepository.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

class MovieRepository: MovieRepositoryProtocol {
    private let movieService = MovieService()
    
    func fetchMovies() async throws -> [Movie] {
        let movieDataList = try await movieService.fetchMovies()
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

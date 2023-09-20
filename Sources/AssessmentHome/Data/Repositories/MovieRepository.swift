//
//  MovieRepository.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

class MovieRepository: MovieRepositoryProtocol {
    func fetchMovies() async throws -> [Movie] {
        let apiKey = "2696829a81b1b5827d515ff121700838"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(MovieApiResponse.self, from: data)
        
        let movies = response.results.map { movieData in
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

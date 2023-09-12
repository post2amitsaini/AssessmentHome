//
//  File.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import Foundation
import Combine

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    func fetchMovies() {
        let apiKey = "2696829a81b1b5827d515ff121700838"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }

            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            if let data = data {
                do {
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

                    DispatchQueue.main.async {
                        self.movies = movies
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}




struct MovieApiResponse: Codable {
    let results: [MovieData]
}

struct MovieData: Codable {
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
}


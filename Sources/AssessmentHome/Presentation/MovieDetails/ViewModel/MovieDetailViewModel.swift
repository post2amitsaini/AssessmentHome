//
//  MovieDetailViewModel.swift
//  
//
//  Created by Amit Saini on 20/09/23.
//

import SwiftUI
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie
    @Published var posterImage: UIImage?

    private var cancellables = Set<AnyCancellable>()

    init(movie: Movie) {
        self.movie = movie
    }

    func fetchPosterImage() async {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.imageName)") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.posterImage = image
                }
            }
        } catch {
            print("Error fetching poster image: \(error)")
        }
    }
}

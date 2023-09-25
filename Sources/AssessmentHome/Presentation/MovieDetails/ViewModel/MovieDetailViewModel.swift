//
//  MovieDetailViewModel.swift
//  
//
//  Created by Amit Saini on 20/09/23.
//

import SwiftUI
import Combine
import AssessmentCore

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }
    func posterImageURL() -> URL? {
        return URL(string: Configuration.imageBaseUrl + movie.imageName)
    }

}

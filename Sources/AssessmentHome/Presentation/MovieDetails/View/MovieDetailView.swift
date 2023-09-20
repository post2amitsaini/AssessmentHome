//
//  SwiftUIView.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel

    init(movie: Movie) {
        viewModel = MovieDetailViewModel(movie: movie)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let posterImage = viewModel.posterImage {
                    Image(uiImage: posterImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .green))
                        .frame(width: 200, height: 300)
                }

                Text("Release Date: \(viewModel.movie.releaseDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(viewModel.movie.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(viewModel.movie.title)
        .task {
            await viewModel.fetchPosterImage()
        }
    }
}
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(title: "Sample Movie", genre: "Action", description: "A sample movie description.", imageName: "sample", releaseDate: "2023-08-02"))
    }
}

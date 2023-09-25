//
//  SwiftUIView.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel
    
    init(movie: Movie) {
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(movie: movie))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: viewModel.posterImageURL()) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 300)
                
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
    }
}
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(title: "Sample Movie", genre: "Action", description: "A sample movie description.", imageName: "sample", releaseDate: "2023-08-02"))
    }
}

//
//  SwiftUIView.swift
//
//
//  Created by Amit Saini on 09/09/23.
//

import SwiftUI

public struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    
    public init() { }

    public var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    List(viewModel.movies) { movie in
                        let thumbURL = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.imageName)")
                        NavigationLink(destination: MovieDetailView(movie: movie, posterURL: thumbURL!)) {
                            MovieRow(movie: movie, posterURL: thumbURL!)
                        }
                    }
                    .listStyle(.plain)
                    .padding(.top, 20)
                }
                .frame(width: 350)
                .task {
                    await viewModel.fetchMovies()
                }
            }
            .navigationBarTitle("List View")
        }
    }
}




struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}


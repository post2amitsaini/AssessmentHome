//
//  SwiftUIView.swift
//
//
//  Created by Amit Saini on 09/09/23.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var genre: String
    var description: String
    var imageName: String
    let releaseDate: String
}
/*
struct MovieListView: View {
    let movies: [Movie] = [
        Movie(title: "Movie 1", genre: "Action", description: "This is an action-packed movie.", imageName: "movie1"),
        Movie(title: "Movie 2", genre: "Comedy", description: "A hilarious comedy for all ages.", imageName: "movie2"),
        Movie(title: "Movie 3", genre: "Drama", description: "An emotional rollercoaster.", imageName: "movie3"),
        // Add more movies here
    ]

    var body: some View {
        NavigationView { // Wrap the content in a NavigationView
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.green, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(135))
                    .offset(y: -350)
                
                VStack(spacing: 20) {
//                    Text("List View")
//                        .foregroundColor(.white)
//                        .font(.system(size: 40, weight: .bold, design: .rounded))
//                        .padding(.top, 50)
                    
                    List(movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRow(movie: movie)
                        }
                    }
                    .listStyle(.plain)
                    .padding(.top, 20)
                }
                .frame(width: 350)
            }
            .navigationBarTitle("List View") // Set the navigation bar title
        }
    }
}

*/

public struct MovieListView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    
    public init() { }

    public var body: some View {
        NavigationView {
            ZStack {
                // ... Your existing view code ...

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
                .onAppear {
                    viewModel.fetchMovies()
                }
            }
            .navigationBarTitle("List View")
        }
    }
}

struct MovieRow: View {
    let movie: Movie
    let posterURL: URL

    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: posterURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "exclamationmark.icloud.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(movie.genre)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(movie.description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(10)
    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}


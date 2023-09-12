//
//  SwiftUIView.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    let posterURL: URL

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: posterURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .green))
                            .frame(width: 200, height: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 300)
                    case .failure:
                        Image(systemName: "exclamationmark.icloud.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.red)
                            .frame(width: 200, height: 300)
                    @unknown default:
                        EmptyView()
                    }
                }

//                Text(movie.title)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.primary)

                Text("Release Date: \(movie.releaseDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(movie.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(movie.title)
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(title: "Sample Movie", genre: "Action", description: "A sample movie description.", imageName: "sample", releaseDate: "2023-08-02"), posterURL: URL(string: "https://image.tmdb.org/t/p/w500/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg")!)
    }
}

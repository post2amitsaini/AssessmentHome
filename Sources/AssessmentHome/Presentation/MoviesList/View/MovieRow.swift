//
//  MovieRow.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import SwiftUI

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

//
//  SwiftUIView.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(movie.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text(movie.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(movie.description)
                    .font(.body)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
        .navigationBarTitle(movie.title) // Set the navigation bar title to the movie title
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(title: "Sample Movie", genre: "Action", description: "A sample movie description.", imageName: "sample"))
    }
}

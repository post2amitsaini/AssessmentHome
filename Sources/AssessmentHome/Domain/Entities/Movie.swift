//
//  Movie.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

struct Movie: Identifiable  {
    var id = UUID()
    var title: String
    var genre: String
    var description: String
    var imageName: String
    let releaseDate: String
}

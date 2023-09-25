//
//  MovieServiceProtocol.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMoviesFromNetwork() async throws -> [MovieData]
}

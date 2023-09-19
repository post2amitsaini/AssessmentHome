//
//  MovieRepositoryProtocol.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

protocol MovieRepositoryProtocol {
    func fetchMovies() async throws -> [Movie]
}

//
//  FetchMoviesUseCaseProtocol.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

protocol FetchMoviesUseCaseProtocol {
    func execute() async throws -> [Movie]
}

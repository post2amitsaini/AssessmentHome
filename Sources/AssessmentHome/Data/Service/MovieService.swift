//
//  MovieService.swift
//  
//
//  Created by Amit Saini on 21/09/23.
//

import Foundation
import AssessmentCore

class MovieService: MovieServiceProtocol {
        
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchMoviesFromNetwork() async throws -> [MovieData]{
        let request = NetworkRequest(path: Endpoint.nowPlaying.path, method: .get, queryParameters: ["api_key": Configuration.apiKey])
        do{
           let response = try await networkManager.request(request: request, responseType: MovieApiResponse.self)
            return response.results
        } catch{
            throw error
        }
    }
}

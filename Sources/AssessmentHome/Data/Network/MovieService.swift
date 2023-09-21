//
//  MovieService.swift
//  
//
//  Created by Amit Saini on 21/09/23.
//

import Foundation
import AssessmentCore

struct MovieService {
    private let webservice = Webservice()
    
    private func buildUrl(endpoint: Endpoint) -> URL? {
        let apiKey = Configuration.apiKey
        let urlString = "\(Configuration.baseUrl)\(endpoint.path)?api_key=\(apiKey)"
        return URL(string: urlString)
    }
    
    func fetchMovies() async throws -> [MovieData] {
        guard let url = buildUrl(endpoint: .nowPlaying) else {
            throw NetworkError.badUrl
        }
        let resource = Resource<MovieApiResponse>(url: url)
        let response = try await webservice.load(resource)
        return response.results
    }
}

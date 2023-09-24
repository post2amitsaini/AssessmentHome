//
//  Endpoint.swift
//  
//
//  Created by Amit Saini on 21/09/23.
//

import Foundation

enum Endpoint {
    case nowPlaying
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/movie/now_playing"
        }
    }
}

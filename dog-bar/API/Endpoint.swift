//
//  Endpoint.swift
//  dog-bar
//
//  Created by Nicholas McDonald on 11/4/21.
//

import Foundation

struct Endpoint {
    var host: String
    var path: String = ""
    var queryItems: [URLQueryItem]?
    var scheme = "https"
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

extension Endpoint {
    private static let BASE_PATH = "/api"
    private static let BASE_HOST = "dog.ceo"
    static let FETCH_RANDOM_IMAGE = Endpoint(
        host: BASE_HOST,
        path: BASE_PATH + "/breeds/image/random")
}

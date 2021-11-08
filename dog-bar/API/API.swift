//
//  API.swift
//  dog-bar
//
//  Created by Nicholas McDonald on 11/5/21.
//

import Foundation

class API {
    func get<T>(
        type: T.Type,
        endpoint: Endpoint)
    async -> T?
    where T: Decodable {
        return await get(type: type, url: endpoint.url)
    }
    
    func get<T>(type: T.Type, url: URL) async -> T? where T: Decodable {
        return await get(type: type, request: URLRequest(url: url))
    }
    
    func get<T>(
        type: T.Type,
        request: URLRequest)
    async -> T?
    where T: Decodable {
        guard let (data, response) =
                try? await URLSession.shared.data(for: request) else {
                    return nil
                }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                return nil
            }
            
            return try? JSONDecoder().decode(T.self, from: data)
    }
}

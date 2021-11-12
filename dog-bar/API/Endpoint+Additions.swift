//
//  Endpoint+Additions.swift
//  dog-bar
//
//  Created by Nicholas McDonald on 11/10/21.
//

import Foundation
import nickdonald_boilerplate

extension Endpoint {
    private static let basePath = "/api"
    private static let baseHost = "dog.ceo"
    static let fetchRandomImage = Endpoint(
        host: baseHost,
        path: basePath + "/breeds/image/random")
}

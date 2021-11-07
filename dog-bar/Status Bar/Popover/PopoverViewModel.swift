//
//  PopoverViewModel.swift
//  dog-bar
//
//  Created by Nicholas McDonald on 11/4/21.
//

import Foundation

@MainActor
class PopoverViewModel: ObservableObject {
    private let api = API()
    @Published var isFetching = false
    @Published var photoLocation: URL?
    
    func fetchPhotoLocation() async {
        isFetching = true
        photoLocation = await fetch()
        isFetching = false
    }
    
    private func fetch() async -> URL? {
        let fetchResponse = await api.get(
            type: RandomDogFetchResponse.self,
            endpoint: Endpoint.FETCH_RANDOM_IMAGE)
        
        guard let url = fetchResponse?.message else {
            return nil
        }
        
        return URL(string: url)
    }
    
    private struct RandomDogFetchResponse: Decodable {
        var message: String?
        var status: String?
    }
}

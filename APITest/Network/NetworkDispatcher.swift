//
//  NetworkDispatcher.swift
//  APITest
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import Foundation

class NetworkDispatcher: NbaAPIClient {
    
    // MARK: - Properties
    
    private let playerReferencesRequest: PlayerReferencesRequest
    
    // MARK: - Initialization
    
    required init(request: PlayerReferencesRequest) {
        self.playerReferencesRequest = request
    }
    
    // MARK: - Network Request
    
    func requestPlayerReferences(onSuccess: @escaping PlayerReferencesCallback, onFailure: @escaping (NetworkErrorCallback)) {
        guard let url = playerReferencesRequest.endpointURL else { return }
        var request = URLRequest(url: url)
        
        request.addValue(playerReferencesRequest.header.first!.key, forHTTPHeaderField: playerReferencesRequest.header.first!.value)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                onFailure(.failedRequest)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    onSuccess(JSONParser.parsePlayerReferences(with: data))
                } else {
                    onFailure(.failedRequest)
                }
            } else {
                onFailure(.unknown)
            }
            }.resume()
        
        
    }
    
}

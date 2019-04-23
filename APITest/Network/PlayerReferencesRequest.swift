//
//  PlayerReferencesRequest.swift
//  APITest
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import Foundation

struct PlayerReferencesRequest {
    
    // MARK: - Properties
    
    let urlString: String
    let header: [String : String]
    
    var endpointURL: URL? {
        return URL(string: urlString)
    }
    
}


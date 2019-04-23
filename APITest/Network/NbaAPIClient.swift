//
//  NbaAPIClient.swift
//  APITest
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import Foundation

typealias NbaStandingsCallback = ([PlayerReferences]) -> Void
typealias NetworkErrorCallback = (NbaNetworkError) -> Void

protocol NbaAPIClient {
    func requestTeamStandings(onSuccess: @escaping NbaStandingsCallback,
                              onFailure: @escaping (NetworkErrorCallback))
}

// MARK: - Network Error Enum

enum NbaNetworkError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}

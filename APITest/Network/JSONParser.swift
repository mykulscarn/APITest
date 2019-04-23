//
//  JSONParser.swift
//  APITest
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import Foundation

class JSONParser {
    
    // MARK: - Parse league standings
    
    static func parsePlayerReferences(with data: Data) -> [PlayerReferences] {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonData = json as? [String : Any] else { return [] }
            guard let topLevel = jsonData["references"] as? [String : Any] else { return [] }
            guard let players = topLevel["playerReferences"] as? [[String : Any]] else { return [] }
            
            return parseReferences(with: players)
            
        } catch let parseError {
            print("Error Parsing JSON", parseError)
        }
        return []
    }
    
    // MARK: - Parse the references
    
    
//
//    let id: Int?
//    let firstName: String?
//    let lastName: String?
//    let primaryPosition: String?
//    let jerseyNumber: Int?
//    //  let currentTeam: CurrentTeam?
//    let currentRosterStatus: String?
//    let height: String?
//    let weight: Int?
//    let age: Int?
//    let college: String?
//
    
    
    private static func parseReferences(with players: [[String : Any]]) -> [PlayerReferences] {
        
        var playerStats: [PlayerReferences] = []
        var playerStat = PlayerReferences()
        for player: [String : Any] in players {
//            guard let id = player["id"] as? Int,
//            let firstName = player["firstName"] as? String,
//            let lastName = player["lastName"] as? String,
//            let primaryPosition = player["primaryPosition"] as? String,
//            let jerseyNumber = player["jerseyNumber"] as? String,
//            let currentRosterStatus = player["currentRosterStatus"] as? String,
//            let height = player["height"] as? String,
//            let weight = player["weight"] as? Int,
//            let age = player["age"] as? Int,
//            let college = player["college"] as? String else { return [] }
            playerStats.append(parsePlayers(with: player) )
        }
        return playerStats
    }
    
    // MARK: - Parse the info of the players
    
    private static func parsePlayers(with players: [String: Any]) -> [PlayerReferences] {
        
        var playerStats: [PlayerReferences] = []
        
        for player in players {
            if let playerStat = PlayerReferences(withData: player) {
            //(for: conferenceName, withData: playerJson) {
                playerStats.append(playerStat)
            }
        }
        return playerStats
    }
    
}

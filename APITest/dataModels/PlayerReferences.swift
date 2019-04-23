//
//  File.swift
//  APITest
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//


import Foundation


struct PlayerReferences {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let primaryPosition: String?
    let jerseyNumber: Int?
    //  let currentTeam: CurrentTeam?
    let currentRosterStatus: String?
    let height: String?
    let weight: Int?
    let age: Int?
    let college: String?
    
    
    init?(withData json: [String: Any]) {
        
        
        guard let id = json["id"] as? Int,
            let playerInfo = json["player"] as? [String : Any],
            let firstName = playerInfo["firstName"] as? String,
            let lastName = playerInfo["lastName"] as? String,
            let primaryPosition = playerInfo["primaryPosition"] as? String,
            let jerseyNumber = playerInfo["jerseyNumber"] as? Int,
            //   let currentTeam = playerInfo["currentTeam"] as? String,
            let currentRosterStatus = playerInfo["currentRosterStatus"] as? String,
            let height = playerInfo["height"] as? String,
            let weight = playerInfo["weight"] as? Int,
            let age = playerInfo["age"] as? Int,
            let college = playerInfo["college"] as? String
            else { return nil }
        
//        guard let playerTeam = json["currentTeam"] as? [String : Any],
//            let teamId = playerTeam["id"] as? String,
//            let abbreviation = playerTeam["abbreviation"] as? String
//            else { return nil }
        
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.primaryPosition = primaryPosition
        self.jerseyNumber = jerseyNumber
        self.currentRosterStatus = currentRosterStatus
        self.height = height
        self.weight = weight
        self.age = age
        self.college = college
        
        
        
        
        
        
        //    enum PlayerReferences: String, CodingKey {
        //        case id = "id"
        //        case firstName = "firstName"
        //        case lastName = "lastName"
        //        case primaryPosition = "primaryPosition"
        //        case jerseyNumber = "jerseyNumber"
        //        case currentTeam = "currentTeam"
        //        case currentRosterStatus = "currentRosterStatus"
        //        case height = "height"
        //        case weight = "weight"
        //        case age = "age"
        //        case college = "college"
        //    }
        //
        
        
    }
}


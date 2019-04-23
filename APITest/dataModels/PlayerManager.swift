//
//  PlayerManager.swift
//  APITest
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import Foundation

struct PlayerManager {
    
    let allPlayers: [PlayerReferences]
    var pointGuards: [PlayerReferences] {
        return allPlayers.filter { $0.primaryPosition == "PG" }
    }
    var shootingGuards: [PlayerReferences] {
        return allPlayers.filter { $0.primaryPosition == "SG" }
    }
    var smallForwards: [PlayerReferences] {
        return allPlayers.filter { $0.primaryPosition == "SF" }
    }
    var powerForwards: [PlayerReferences] {
        return allPlayers.filter { $0.primaryPosition == "PF" }
    }
    var centers: [PlayerReferences] {
        return allPlayers.filter { $0.primaryPosition == "C" }
    }
}

//
//  PlayerInfoViewController.swift
//  APITest
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import UIKit

class PlayerInfoViewController: UITableViewController {
    
    
    
    var playerManager: PlayerManager? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrievePlayerStats()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    
    func retrievePlayerStats() {
        toggleActivityIndicator()
        let header = ["Basic  1a9ad43df0104f84b24abdb39f" : "Authorization"]
        let urlString = "https://api.mysportsfeeds.com/v2.1/pull/nba/2019-playoff/player_stats_totals.json"
        let request = PlayerReferencesRequest(urlString: urlString, header: header)
        
        let dispatcher = NetworkDispatcher(request: request)
        
        dispatcher.requestPlayerReferences(onSuccess: { [weak self] (teamStats) in
            self?.toggleActivityIndicator()
            self?.leagueManager = LeagueManager(allTeams: teamStats)
        }) { [weak self] (error) in
            self?.toggleActivityIndicator()
            print("Show network error alert")
        }
    }
    

  
}

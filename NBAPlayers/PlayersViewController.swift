//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by User on 11.11.2020.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let players: [Player] = [
        Player(name: "LeBrone James", position: "SF", height: "6'6", teamName: "Los Angeles Lakers"),
        Player(name: "Antony Davis", position: "PF", height: "7'0", teamName: "Los Angeles Lakers"),
        Player(name: "Jimmy Butler", position: "SG", height: "6'4", teamName: "Miami Heat")
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.teamName
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let playersDetailViewController = storyboard.instantiateViewController(identifier: "PlayerDetailsViewController") as PlayerDetailsViewController
        let player = players[indexPath.row]
        playersDetailViewController.player = player
        navigationController?.pushViewController(playersDetailViewController, animated: true)
    }
}

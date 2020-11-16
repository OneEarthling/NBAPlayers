//
//  PlayerDetailsViewController.swift
//  NBAPlayers
//
//  Created by User on 11.11.2020.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = player?.name
        positionLabel.text = player?.position
        heightLabel.text = player?.height
        
        teamButton.setTitle(player?.teamName, for: .normal)
    }

    @IBAction func onTeamButtonTaped(_ sender: Any) {
        
    }
}

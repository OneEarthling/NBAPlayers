//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by User on 11.11.2020.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorButton: UIButton!
    
    var players: [Player] = []
    let apiclient: ApiClient = ApiClientImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadData()
    }
    
    func showLoading(){
        activityIndicatorView.startAnimating()
        errorLabel.isHidden = true
        errorButton.isHidden = true
    }
    
    func showData(){
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = true
        errorButton.isHidden = true
    }
    
    func showError(){
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = false
        errorButton.isHidden = false
    }
    
    func reloadData(){
        showLoading()
        apiclient.getPlayers(onResult: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.players = players
                    self.tableView.reloadData()
                    self.showData()
                case .failure:
                    self.players = []
                    self.tableView.reloadData()
                    self.showError()
                }
                self.activityIndicatorView.stopAnimating()
            }
            
        })
    }
    
    @IBAction func onReloadButtonTapped(_ sender: Any) {
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.team.fullName
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

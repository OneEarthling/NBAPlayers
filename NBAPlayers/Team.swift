//
//  Team.swift
//  NBAPlayers
//
//  Created by User on 16.11.2020.
//

import Foundation

struct Team {
    let name: String
    let city: String
    let conference: String
    
    var fullName: String {
        return city + " " + name
    }
}

let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")

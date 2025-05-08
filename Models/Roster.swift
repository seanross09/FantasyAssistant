//
//  Roster.swift
//  FantasyAssistant
//
//  Created by Sean Ross on 5/1/25.
//
struct Roster: Codable {
    let ownerID: String  // This should map to "owner_id" from the Sleeper API
    let rosterID: String
    let players: [String]  // List of player IDs in the roster
    
    enum CodingKeys: String, CodingKey {
        case ownerID = "owner_id"
        case rosterID = "roster_id"
        case players
    }
}


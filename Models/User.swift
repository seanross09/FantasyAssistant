//
//  User.swift
//  FantasyAssistant
//
//  Created by Sean Ross on 5/1/25.
//
struct User: Codable {
    let userID: String  // This should map to "user_id" from the Sleeper API
    let displayName: String
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case displayName = "display_name"
        case avatar
    }
}
    
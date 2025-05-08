//
//  TeamViewModel.swift
//  FantasyAssistant
//
//  Created by Sean Ross on 5/1/25.
//

import Foundation

// Define the Team struct based on the expected data fields
struct Team: Identifiable, Decodable {
    let id: String  // This can be user_id
    let displayName: String
    let avatarURL: String?
    let wins: Int?
    let losses: Int?
    let ties: Int?
}

@MainActor
class TeamViewModel: ObservableObject {
    @Published var teams: [Team] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadTeams(forLeague league: League) async {
        print("Loading teams for league: \(league.name)")
        isLoading = true
        errorMessage = nil

        do {
            let users = try await SleeperAPI.shared.fetchUsers(forLeagueID: league.id)
            print("Fetched users: \(users)")

            if users.isEmpty {
                print("No users found in the league.")
            }

            let teams = users.compactMap { user -> Team? in
                let avatarURL = user.avatar.map { "https://sleepercdn.com/avatars/\($0)" }

                return Team(
                    id: user.userID,
                    displayName: user.displayName,
                    avatarURL: avatarURL,
                    wins: nil,
                    losses: nil,
                    ties: nil
                )
            }

            self.teams = teams
            print("Teams loaded: \(self.teams)")
        } catch {
            errorMessage = "Failed to load teams: \(error.localizedDescription)"
            print("Error: \(error)")
        }

        isLoading = false
    }
}

// LeagueViewModel.swift
// FantasyAssistant
//
// Created by Sean Ross on 4/24/25.

import Foundation
import Combine

class LeagueViewModel: ObservableObject {
    @Published var leagues: [League] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func loadLeagues(username: String) {
        isLoading = true
        errorMessage = nil // Reset error message before making a new request

        // Get user ID first
        SleeperAPI.shared.getUserID(for: username) { userID in
            guard let userID = userID else {
                DispatchQueue.main.async {
                    self.errorMessage = "User not found"
                    self.isLoading = false
                }
                return
            }

            // Fetch leagues using the obtained user ID
            SleeperAPI.shared.getLeagues(for: userID, season: "2025") { leagues in
                DispatchQueue.main.async {
                    if let leagues = leagues {
                        self.leagues = leagues
                    } else {
                        self.errorMessage = "Failed to load leagues"
                    }
                    self.isLoading = false
                }
            }
        }
    }
}

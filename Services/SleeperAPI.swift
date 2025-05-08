// SleeperAPI.swift
// FantasyAssistant
//
// Created by Sean Ross on 4/24/25.
import Foundation

class SleeperAPI {
    static let shared = SleeperAPI()  // Singleton
    
    // Fetch user data based on username to get their user ID
    func getUserID(for username: String, completion: @escaping (String?) -> Void) {
        let urlString = "https://api.sleeper.app/v1/user/\(username)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL for user ID")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching user ID: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received for user ID")
                completion(nil)
                return
            }
            
            do {
                if let userData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let userID = userData["user_id"] as? String {
                    completion(userID)
                } else {
                    print("Invalid data format for user ID")
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    // Fetch leagues for a given user ID and season
    func getLeagues(for userID: String, season: String, completion: @escaping ([League]?) -> Void) {
        let urlString = "https://api.sleeper.app/v1/user/\(userID)/leagues/nfl/\(season)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL for leagues")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching leagues: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received for leagues")
                completion(nil)
                return
            }

            // Debugging: print raw JSON string
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON for leagues:\n\(jsonString)")
            } else {
                print("Failed to decode raw data to string for leagues")
            }

            do {
                let leagues = try JSONDecoder().decode([League].self, from: data)
                completion(leagues)
            } catch {
                print("Error decoding leagues data: \(error.localizedDescription)")
                completion(nil)
            }
        }

        task.resume()
    }

    // Fetch users for a given league ID
    func fetchUsers(forLeagueID leagueID: String) async throws -> [User] {
        let url = URL(string: "https://api.sleeper.app/v1/league/\(leagueID)/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        print("Raw data for users: \(String(data: data, encoding: .utf8) ?? "No data")")  // Debugging print
        
        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            return users
        } catch {
            print("Error decoding users data: \(error.localizedDescription)")
            throw error
        }
    }

    
    
    
    // Fetch rosters for a given league ID
    func fetchRosters(forLeagueID leagueID: String) async throws -> [Roster] {
        let url = URL(string: "https://api.sleeper.app/v1/league/\(leagueID)/rosters")!
        let (data, _) = try await URLSession.shared.data(from: url)
        print("Raw data for rosters: \(String(data: data, encoding: .utf8) ?? "No data")")  // Debugging print
        
        do {
            let rosters = try JSONDecoder().decode([Roster].self, from: data)
            return rosters
        } catch {
            print("Error decoding rosters data: \(error.localizedDescription)")
            throw error
        }
    }

    // Fetch teams for a given league ID
    func fetchTeams(forLeagueID leagueID: String) async throws -> [Team] {
        let url = URL(string: "https://api.sleeper.app/v1/league/\(leagueID)/teams")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let teams = try JSONDecoder().decode([Team].self, from: data)
            return teams
        } catch {
            print("Error decoding teams data: \(error.localizedDescription)")
            throw error
        }
    }
}

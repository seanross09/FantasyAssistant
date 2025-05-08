// LeagueListView.swift
// FantasyAssistant
//
// Created by Sean Ross on 4/24/25.

import SwiftUI

struct LeagueListView: View {
    @StateObject private var viewModel = LeagueViewModel()
    @StateObject private var teamViewModel = TeamViewModel()  // Add the team view model

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding()
                } else if viewModel.leagues.isEmpty {
                    Text("No Leagues Available")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding()
                } else {
                    List(viewModel.leagues) { league in
                        NavigationLink(destination: LeagueDetailView(league: league, teamViewModel: teamViewModel)) {
                            VStack(alignment: .leading) {
                                Text(league.name)
                                    .font(.headline)
                                Text("Season: \(league.season)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Your Leagues")
            .onAppear {
                print("Loading leagues for username: dkmetcalfbestwr")  // Debugging line
                viewModel.loadLeagues(username: "dkmetcalfbestwr")
            }
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        // Use a sample league for preview purposes
        LeagueListView()
            .previewDevice("iPhone 15")
    }
}

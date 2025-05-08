// TeamListView.swift
// FantasyAssistant
//
// Created by Sean Ross on 5/1/25.

import SwiftUI

struct TeamListView: View {
    @ObservedObject var viewModel: TeamViewModel
    let league: League

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.teams) { team in
                        NavigationLink(destination: TeamDetailView(team: team)) {
                            TeamRowView(team: team)
                        }
                    }
                }
            }
            .navigationTitle("Teams")
            .onAppear {
                Task {
                    await viewModel.loadTeams(forLeague: league)
                }
            }
        }
    }
}

struct TeamRowView: View {
    let team: Team

    var body: some View {
        HStack {
            AvatarView(avatarURL: team.avatarURL, size: 40)

            VStack(alignment: .leading) {
                Text(team.displayName)
                    .font(.headline)
                HStack {
                    Text("W: \(team.wins ?? 0) L: \(team.losses ?? 0) T: \(team.ties ?? 0)")
                        .font(.subheadline)
                }
            }

            Spacer()
        }
        .padding()
    }
}

struct TeamDetailView: View {
    let team: Team

    var body: some View {
        VStack {
            AvatarView(avatarURL: team.avatarURL, size: 100)

            Text(team.displayName)
                .font(.largeTitle)
                .padding()

            HStack {
                Text("Wins: \(team.wins ?? 0)")
                Text("Losses: \(team.losses ?? 0)")
                Text("Ties: \(team.ties ?? 0)")
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Team Details")
    }
}

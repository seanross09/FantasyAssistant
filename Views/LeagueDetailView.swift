//  LeagueDetailView.swift
//  FantasyAssistant
//
//  Created by Sean Ross on 4/28/25.
import SwiftUI

struct LeagueDetailView: View {
    let league: League
    @StateObject var teamViewModel: TeamViewModel

    var body: some View {
        TabView {
            // League Info Tab
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        AvatarView(
                            avatarURL: league.avatar.map { "https://sleepercdn.com/avatars/\($0)" },
                            size: 100
                        )

                        VStack(alignment: .leading) {
                            Text(league.name)
                                .font(.largeTitle)
                                .bold()

                            Text("Season: \(league.season)")
                                .font(.headline)

                            if let totalRosters = league.totalRosters {
                                Text("Total Rosters: \(totalRosters)")
                            }

                            if let status = league.status {
                                Text("Status: \(status.capitalized)")
                            }
                        }
                    }
                    .padding()

                    Divider()

                    if let settings = league.settings {
                        VStack(alignment: .leading) {
                            Text("Settings")
                                .font(.headline)
                                .padding([.top, .leading])

                            SettingRow(label: "Waiver Budget", value: "\(settings.waiverBudget ?? 0)")
                            SettingRow(label: "Max Keepers", value: "\(settings.maxKeepers ?? 0)")
                            SettingRow(label: "Playoff Teams", value: "\(settings.playoffTeams ?? 0)")
                        }
                        .padding([.horizontal, .top])
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
            .tabItem {
                Label("League Info", systemImage: "info.circle")
            }

            // Scoring Settings Tab
            if let scoringSettings = league.scoringSettings {
                ScoringSettingsView(scoringSettings: scoringSettings)
                    .tabItem {
                        Label("Scoring", systemImage: "pencil.circle")
                    }
            }

            // Teams Tab
            TeamListView(viewModel: teamViewModel, league: league)
                .tabItem {
                    Label("Teams", systemImage: "person.3")
                }
        }
        .navigationTitle("League Details")
    }
}

struct SettingRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
            Spacer()
            Text(value)
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .padding(.vertical, 5)
    }
}


struct LeagueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleSettings = Settings(
            waiverBudget: 100,
            disableAdds: nil,
            capacityOverride: nil,
            waiverBidMin: nil,
            taxiDeadline: nil,
            draftRounds: nil,
            reserveAllowNa: nil,
            startWeek: nil,
            playoffSeedType: nil,
            playoffTeams: 6,
            numTeams: nil,
            dailyWaiversHour: nil,
            playoffType: nil,
            taxiSlots: nil,
            playoffWeekStart: nil,
            waiverClearDays: nil,
            reserveAllowDoubtful: nil,
            commissionerDirectInvite: nil,
            reserveAllowDnr: nil,
            taxiAllowVets: nil,
            waiverDayOfWeek: nil,
            playoffRoundType: nil,
            reserveAllowOut: nil,
            reserveAllowSus: nil,
            tradeDeadline: nil,
            taxiYears: nil,
            dailyWaivers: nil,
            pickTrading: nil,
            type: nil,
            maxKeepers: 3,
            waiverType: nil,
            leagueAverageMatch: nil,
            tradeReviewDays: nil,
            benchLock: nil,
            offseasonAdds: nil,
            leg: nil,
            reserveSlots: nil,
            reserveAllowCov: nil
        )

        let sampleLeague = League(
            id: "someId",
            name: "League Name",
            season: "2025",
            avatar: nil,
            totalRosters: 10,
            status: "active",
            scoringSettings: [
                "Rush TD": 6.0,
                "Field Goal 40+": 4.0,
                "Sack": 1.0
            ],
            rosterPositions: ["QB", "RB", "WR"],
            settings: sampleSettings
        )

        return LeagueDetailView(league: sampleLeague, teamViewModel: TeamViewModel())
    }
}



//
//
// League.swift
// FantasyAssistant
//
// Created by Sean Ross on 4/24/25.

import Foundation

struct League: Codable, Identifiable {
    let id: String
    let name: String
    let season: String
    let avatar: String?
    let totalRosters: Int?
    let status: String?
    let scoringSettings: [String: Double]?  // Adjusted for correct type
    let rosterPositions: [String]?  // Optional field
    let settings: Settings?  // New model for the nested 'settings'
    
    enum CodingKeys: String, CodingKey {
        case id = "league_id"
        case name
        case season
        case avatar
        case totalRosters = "total_rosters"
        case status
        case scoringSettings = "scoring_settings"
        case rosterPositions = "roster_positions"
        case settings
    }
}


// New Settings struct to match the 'settings' object in JSON
struct Settings: Codable {
    let waiverBudget: Int?
    let disableAdds: Int?
    let capacityOverride: Int?
    let waiverBidMin: Int?
    let taxiDeadline: Int?
    let draftRounds: Int?
    let reserveAllowNa: Int?
    let startWeek: Int?
    let playoffSeedType: Int?
    let playoffTeams: Int?
    let numTeams: Int?
    let dailyWaiversHour: Int?
    let playoffType: Int?
    let taxiSlots: Int?
    let playoffWeekStart: Int?
    let waiverClearDays: Int?
    let reserveAllowDoubtful: Int?
    let commissionerDirectInvite: Int?
    let reserveAllowDnr: Int?
    let taxiAllowVets: Int?
    let waiverDayOfWeek: Int?
    let playoffRoundType: Int?
    let reserveAllowOut: Int?
    let reserveAllowSus: Int?
    let tradeDeadline: Int?
    let taxiYears: Int?
    let dailyWaivers: Int?
    let pickTrading: Int?
    let type: Int?
    let maxKeepers: Int?
    let waiverType: Int?
    let leagueAverageMatch: Int?
    let tradeReviewDays: Int?
    let benchLock: Int?
    let offseasonAdds: Int?
    let leg: Int?
    let reserveSlots: Int?
    let reserveAllowCov: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case waiverBudget = "waiver_budget"
        case disableAdds = "disable_adds"
        case capacityOverride = "capacity_override"
        case waiverBidMin = "waiver_bid_min"
        case taxiDeadline = "taxi_deadline"
        case draftRounds = "draft_rounds"
        case reserveAllowNa = "reserve_allow_na"
        case startWeek = "start_week"
        case playoffSeedType = "playoff_seed_type"
        case playoffTeams = "playoff_teams"
        case numTeams = "num_teams"
        case dailyWaiversHour = "daily_waivers_hour"
        case playoffType = "playoff_type"
        case taxiSlots = "taxi_slots"
        case playoffWeekStart = "playoff_week_start"
        case waiverClearDays = "waiver_clear_days"
        case reserveAllowDoubtful = "reserve_allow_doubtful"
        case commissionerDirectInvite = "commissioner_direct_invite"
        case reserveAllowDnr = "reserve_allow_dnr"
        case taxiAllowVets = "taxi_allow_vets"
        case waiverDayOfWeek = "waiver_day_of_week"
        case playoffRoundType = "playoff_round_type"
        case reserveAllowOut = "reserve_allow_out"
        case reserveAllowSus = "reserve_allow_sus"
        case tradeDeadline = "trade_deadline"
        case taxiYears = "taxi_years"
        case dailyWaivers = "daily_waivers"
        case pickTrading = "pick_trading"
        case type
        case maxKeepers = "max_keepers"
        case waiverType = "waiver_type"
        case leagueAverageMatch = "league_average_match"
        case tradeReviewDays = "trade_review_days"
        case benchLock = "bench_lock"
        case offseasonAdds = "offseason_adds"
        case leg
        case reserveSlots = "reserve_slots"
        case reserveAllowCov = "reserve_allow_cov"
    }
}

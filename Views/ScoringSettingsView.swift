//
//  ScoringSettingsView.swift
//  FantasyAssistant
//
//  Created by Sean Ross on 4/29/25.
//

import SwiftUI

struct ScoringSettingsView: View {
    let scoringSettings: [String: Double]

    var body: some View {
            ScrollView {  // Add ScrollView to allow scrolling
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Scoring settings
                    ForEach(scoringSettings.keys.sorted(), id: \.self) { key in
                        VStack(alignment: .leading) {
                            Text(scoreSettingName(for: key))
                                .font(.headline)
                                .bold()
                            Text("\(scoringSettings[key]!, specifier: "%.1f") points")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(10)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)  // Padding for the sides
            }
        }
    
    // A function to convert scoring setting names into human-readable form
    private func scoreSettingName(for key: String) -> String {
        switch key {
        case "sack":
            return "Sack"
        case "qb_hit":
            return "Quarterback Hit"
        case "fgm_40_49":
            return "Field Goal 40-49 Yards"
        case "bonus_rec_te":
            return "Bonus Reception (TE)"
        case "fgm_yds":
            return "Field Goal Yards"
        case "def_forced_punts":
            return "Defensive Forced Punts"
        case "bonus_rec_yd_100":
            return "Bonus Reception Yards 100+"
        case "bonus_rush_yd_100":
            return "Bonus Rushing Yards 100+"
        case "pass_int":
            return "Interception"
        case "fgmiss_50p":
            return "Missed Field Goal 50+"
        case "pts_allow_0":
            return "Points Allowed 0"
        case "bonus_pass_yd_400":
            return "Bonus Passing Yards 400+"
        case "pass_2pt":
            return "Passing 2-Point Conversion"
        case "rec_0_4":
            return "Reception 0-4 Yards"
        case "yds_allow_450_499":
            return "Yards Allowed 450-499"
        case "blk_kick_ret_yd":
            return "Blocked Kick Return Yards"
        case "st_td":
            return "Special Teams Touchdown"
        case "def_pr_yd":
            return "Defensive Punt Return Yards"
        case "rec_30_39":
            return "Reception 30-39 Yards"
        case "sack_yd":
            return "Sack Yards"
        case "fgm_yds_over_30":
            return "Field Goal 30+ Yards"
        case "rec_td":
            return "Reception Touchdown"
        case "yds_allow_400_449":
            return "Yards Allowed 400-449"
        case "tkl_ast":
            return "Tackles (Assists)"
        case "rec_20_29":
            return "Reception 20-29 Yards"
        case "idp_blk_kick":
            return "IDP Blocked Kick"
        case "fgm_30_39":
            return "Field Goal 30-39 Yards"
        case "fgm_50_59":
            return "Field Goal 50-59 Yards"
        case "idp_fum_ret_yd":
            return "IDP Fumble Return Yards"
        case "xpmiss":
            return "Missed Extra Point"
        case "rush_td_50p":
            return "Rushing Touchdown 50+ Yards"
        case "rush_td":
            return "Rushing Touchdown"
        case "def_kr_yd":
            return "Defensive Kickoff Return Yards"
        case "bonus_fd_wr":
            return "Bonus First Down (WR)"
        case "pts_allow":
            return "Points Allowed"
        case "def_4_and_stop":
            return "Defensive 4th Down Stop"
        case "fg_ret_yd":
            return "Field Goal Return Yards"
        case "idp_tkl":
            return "IDP Tackles"
        case "yds_allow_550p":
            return "Yards Allowed 550+"
        case "pass_td_40p":
            return "Passing Touchdown 40+ Yards"
        case "def_st_tkl_solo":
            return "Defensive Special Teams Solo Tackles"
        case "yds_allow_350_399":
            return "Yards Allowed 350-399"
        case "fgm":
            return "Field Goal Made"
        case "idp_sack_yd":
            return "IDP Sack Yards"
        case "bonus_rush_rec_yd_100":
            return "Bonus Rush/Rec Yards 100+"
        case "rec_2pt":
            return "Reception 2-Point Conversion"
        case "bonus_pass_cmp_25":
            return "Bonus Pass Completions 25+"
        case "idp_tkl_loss":
            return "IDP Tackles for Loss"
        case "rush_fd":
            return "Rushing First Down"
        case "pass_int_td":
            return "Interception Touchdown"
        case "int_ret_yd":
            return "Interception Return Yards"
        case "idp_tkl_solo":
            return "IDP Solo Tackles"
        case "pass_att":
            return "Pass Attempts"
        case "st_fum_rec":
            return "Special Teams Fumble Recovery"
        case "fgmiss":
            return "Missed Field Goal"
        case "bonus_def_fum_td_50p":
            return "Bonus Defensive Fumble TD 50+ Yards"
        case "ff":
            return "Forced Fumble"
        case "idp_int":
            return "IDP Interception"
        case "bonus_sack_2p":
            return "Bonus Sack 2+ Yards"
        case "fgmiss_30_39":
            return "Missed Field Goal 30-39 Yards"
        case "rec":
            return "Reception"
        case "yds_allow_200_299":
            return "Yards Allowed 200-299"
        case "idp_int_ret_yd":
            return "IDP Interception Return Yards"
        case "idp_safe":
            return "IDP Safety"
        case "pts_allow_14_20":
            return "Points Allowed 14-20"
        case "def_2pt":
            return "Defensive 2-Point Conversion"
        case "fgm_0_19":
            return "Field Goal 0-19 Yards"
        case "idp_def_td":
            return "IDP Defensive Touchdown"
        case "idp_pass_def_3p":
            return "IDP Pass Deflection 3+"
        case "int":
            return "Interception"
        case "def_st_fum_rec":
            return "Defensive Special Teams Fumble Recovery"
        case "fum_lost":
            return "Fumble Lost"
        case "pts_allow_1_6":
            return "Points Allowed 1-6"
        case "rec_fd":
            return "Reception First Down"
        case "kr_yd":
            return "Kickoff Return Yards"
        case "fgm_60p":
            return "Field Goal 60+ Yards"
        case "fgmiss_20_29":
            return "Missed Field Goal 20-29 Yards"
        case "rush_att":
            return "Rushing Attempts"
        case "st_tkl_solo":
            return "Special Teams Solo Tackles"
        case "yds_allow":
            return "Yards Allowed"
        case "rec_5_9":
            return "Reception 5-9 Yards"
        case "idp_sack":
            return "IDP Sack"
        case "fgm_20_29":
            return "Field Goal 20-29 Yards"
        case "fgmiss_60p":
            return "Missed Field Goal 60+ Yards"
        case "yds_allow_500_549":
            return "Yards Allowed 500-549"
        case "pts_allow_21_27":
            return "Points Allowed 21-27"
        case "bonus_rec_wr":
            return "Bonus Reception (WR)"
        case "bonus_pass_yd_300":
            return "Bonus Passing Yards 300+"
        case "xpm":
            return "Extra Point Made"
        case "pass_td_50p":
            return "Passing Touchdown 50+ Yards"
        case "pass_sack":
            return "Pass Sack"
        case "rec_40p":
            return "Reception 40+ Yards"
        case "def_3_and_out":
            return "Defensive 3-and-Out"
        case "fgmiss_50_59":
            return "Missed Field Goal 50-59 Yards"
        case "fgmiss_0_19":
            return "Missed Field Goal 0-19 Yards"
        case "pass_cmp":
            return "Pass Completions"
        case "tkl_loss":
            return "Tackles for Loss"
        case "rush_2pt":
            return "Rushing 2-Point Conversion"
        case "def_pass_def":
            return "Defensive Pass Deflection"
        case "yds_allow_300_349":
            return "Yards Allowed 300-349"
        case "fum_rec":
            return "Fumble Recovery"
        case "idp_pass_def":
            return "IDP Pass Deflection"
        case "rec_10_19":
            return "Reception 10-19 Yards"
        case "bonus_rec_yd_200":
            return "Bonus Reception Yards 200+"
        case "def_st_td":
            return "Defensive Special Teams Touchdown"
        case "tkl":
            return "Tackles"
        case "pass_cmp_40p":
            return "Pass Completions 40+ Yards"
        case "fgm_50p":
            return "Field Goal 50+ Yards"
        case "bonus_tkl_10p":
            return "Bonus Tackles 10+"
        case "def_td":
            return "Defensive Touchdown"
        case "idp_fum_rec":
            return "IDP Fumble Recovery"
        case "pass_fd":
            return "Passing First Down"
        case "rec_td_40p":
            return "Reception Touchdown 40+ Yards"
        case "bonus_rush_yd_200":
            return "Bonus Rushing Yards 200+"
        case "safe":
            return "Safety"
        case "pass_yd":
            return "Passing Yards"
        case "fgmiss_40_49":
            return "Missed Field Goal 40-49 Yards"
        case "rec_td_50p":
            return "Reception Touchdown 50+ Yards"
        case "blk_kick":
            return "Blocked Kick"
        case "pass_td":
            return "Passing Touchdown"
        case "tkl_solo":
            return "Solo Tackles"
        case "bonus_rush_att_20":
            return "Bonus Rushing Attempts 20+"
        case "yds_allow_100_199":
            return "Yards Allowed 100-199"
        case "bonus_def_int_td_50p":
            return "Bonus Defensive Interception TD 50+ Yards"
        case "idp_qb_hit":
            return "IDP Quarterback Hit"
        case "bonus_fd_qb":
            return "Bonus First Down (QB)"
        case "rush_yd":
            return "Rushing Yards"
        case "yds_allow_0_100":
            return "Yards Allowed 0-100"
        case "bonus_rec_rb":
            return "Bonus Reception (RB)"
        case "rush_40p":
            return "Rushing 40+ Yards"
        case "pr_yd":
            return "Punt Return Yards"
        case "fum":
            return "Fumble"
        case "pts_allow_28_34":
            return "Points Allowed 28-34"
        case "pts_allow_35p":
            return "Points Allowed 35+"
        case "bonus_rush_rec_yd_200":
            return "Bonus Rush/Rec Yards 200+"
        case "fum_rec_td":
            return "Fumble Recovery Touchdown"
        case "rec_yd":
            return "Reception Yards"
        case "rush_td_40p":
            return "Rushing Touchdown 40+ Yards"
        case "bonus_fd_te":
            return "Bonus First Down (TE)"
        case "bonus_fd_rb":
            return "Bonus First Down (RB)"
        case "fum_ret_yd":
            return "Fumble Return Yards"
        case "def_st_ff":
            return "Defensive Special Teams Forced Fumble"
        case "pass_inc":
            return "Pass Incompletion"
        case "pts_allow_7_13":
            return "Points Allowed 7-13"
        case "idp_ff":
            return "IDP Forced Fumble"
        case "st_ff":
            return "Special Teams Forced Fumble"
        case "idp_tkl_ast":
            return "IDP Tackles (Assists)"
        default:
            return key
        }
    }

}

struct ScoringSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ScoringSettingsView(scoringSettings: [
            "Rush TD": 6.0,
            "Field Goal 40+": 4.0,
            "Sack": 1.0,
            "Pass TD": 4.0,
            "Reception": 1.0
        ])
    }
}

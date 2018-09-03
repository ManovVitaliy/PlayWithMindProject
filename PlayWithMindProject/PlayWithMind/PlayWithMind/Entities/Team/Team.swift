//
//  Team.swift
//  PlayWithMind
//
//  Created by user on 7/10/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Team {
    
    // MARK: - keys
    static let teamNameKey = "teamName"
    static let teamImageKey = "teamImage"
    static let coachPowerKey = "teamCoachPower"
    static let coachNameKey = "teamCoachName"
    static let coachImageKey = "teamCoachImage"
    static let teamMotivationKey = "teamMotivation"
    static let teamCollaborationKey = "teamCollaboration"
    static let teamSchemeKey = "teamScheme"
    static let teamStandartsGameKey = "standartsGame"
    static let teamSurrenderKey = "teamSurrender"
    static let teamCharacterKey = "teamCharacter"
    static let teamBenchLengthKey = "teamBenchLength"
    
    // MARK: - properties
    var teamImage: String = ""
    var teamName: String = ""
    var coachPower: String = "0"
    var coachName: String = ""
    var coachImage: String = ""
    var teamMotivation: String = "0"
    var teamCollaboration: String = "0"
    var teamScheme: String = ""
    var standartsGame: String = "0"
    var surrender: String = "0"
    var characterTeam: String = "0"
    var teamBenchLength: String = "0"
    
    // convert model Team to dictionary
    class func fromModelToDict(team: Team) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = [teamNameKey: team.teamName,
                          teamImageKey: team.teamImage,
                          coachPowerKey: team.coachPower,
                          coachNameKey: team.coachName,
                          coachImageKey: team.coachImage,
                          teamMotivationKey: team.teamMotivation,
                          teamCollaborationKey: team.teamCollaboration,
                          teamSchemeKey: team.teamScheme,
                          teamStandartsGameKey: team.standartsGame,
                          teamSurrenderKey: team.surrender,
                          teamCharacterKey: team.characterTeam,
                          teamBenchLengthKey: team.teamBenchLength] as [String : Any]
        dict = [team.teamName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    // convert dictionary to Team
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Team {
        let team = Team()
        if let teamName = dictionary[teamNameKey] as? String {
            team.teamName = teamName
        }
        if let teamImage = dictionary[teamImageKey] as? String {
            team.teamImage = teamImage
        }
        if let coachPower = dictionary[coachPowerKey] as? String {
            team.coachPower = coachPower
        }
        if let coachName = dictionary[coachNameKey] as? String {
            team.coachName = coachName
        }
        if let coachImage = dictionary[coachImageKey] as? String {
            team.coachImage = coachImage
        }
        if let teamMotivation = dictionary[teamMotivationKey] as? String {
            team.teamMotivation = teamMotivation
        }
        if let teamCollaboration = dictionary[teamCollaborationKey] as? String {
            team.teamCollaboration = teamCollaboration
        }
        if let teamScheme = dictionary[teamSchemeKey] as? String {
            team.teamScheme = teamScheme
        }
        if let standartsGame = dictionary[teamStandartsGameKey] as? String {
            team.standartsGame = standartsGame
        }
        if let surrender = dictionary[teamSurrenderKey] as? String {
            team.surrender = surrender
        }
        if let characterTeam = dictionary[teamCharacterKey] as? String {
            team.characterTeam = characterTeam
        }
        if let benchLength = dictionary[teamBenchLengthKey] as? String {
            team.teamBenchLength = benchLength
        }
        
        return team
    }
}

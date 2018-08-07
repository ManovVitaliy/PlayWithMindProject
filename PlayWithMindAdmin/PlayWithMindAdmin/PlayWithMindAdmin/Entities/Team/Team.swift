//
//  Team.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Team {
    
    // MARK: - keys
    static let teamNameKey = "teamName"
    static let teamImageKey = "teamImage"
    static let coachPowerKey = "teamCoachPower"
    static let teamMotivationKey = "teamMotivation"
    static let teamCollaborationKey = "teamCollaboration"
    
    var teamImage: String = ""
    var teamName: String = ""
    var coachPower: String = "0"
    var teamMotivation: String = "0"
    var teamCollaboration: String = "0"
    
    class func fromModelToDict(team: Team) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = [teamNameKey: team.teamName,
                          teamImageKey: team.teamImage,
                          coachPowerKey: team.coachPower,
                          teamMotivationKey: team.teamMotivation,
                          teamCollaborationKey: team.teamCollaboration] as [String : Any]
        dict = [team.teamName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
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
        if let teamMotivation = dictionary[teamMotivationKey] as? String {
            team.teamMotivation = teamMotivation
        }
        if let teamCollaboration = dictionary[teamCollaborationKey] as? String {
            team.teamCollaboration = teamCollaboration
        }
        
        return team
    }
}

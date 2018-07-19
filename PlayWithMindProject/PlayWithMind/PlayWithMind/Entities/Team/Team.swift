//
//  Team.swift
//  PlayWithMind
//
//  Created by user on 7/10/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Team {
    var teamImage: String = ""
    var teamName: String = ""
    
    class func fromModelToDict(team: Team) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = ["name": team.teamName,
                          "image": team.teamImage]
        dict = [team.teamName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Team {
        let team = Team()
        if let teamName = dictionary["name"] as? String {
            team.teamName = teamName
        }
        if let teamImage = dictionary["image"] as? String {
            team.teamImage = teamImage
        }
        
        return team
    }
}

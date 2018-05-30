//
//  Player.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/25/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Player {
    var playerImage: String = ""
    var playerName: String = ""
    
    class func fromModelToDict(player: Player) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = ["name": player.playerName,
                          "image": player.playerImage]
        dict = [player.playerName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Player {
        let player = Player()
        if let playerName = dictionary["name"] as? String {
            player.playerName = playerName
        }
        if let playerImage = dictionary["image"] as? String {
            player.playerImage = playerImage
        }
        
        return player
    }
}

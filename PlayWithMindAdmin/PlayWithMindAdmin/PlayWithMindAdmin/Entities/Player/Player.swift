//
//  Player.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/25/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Player {
    
    // MARK: - keys
    static let playerNameKey = "playerName"
    static let playerImageKey = "playerImage"
    static let playerNationalityKey = "nationality"
    static let playerPositionKey = "playerPosition"
    static let attackingProwessKey = "attackingProwess"
    static let defensiveProwessKey = "defensiveProwess"
    static let ballControllKey = "ballControll"
    static let shotKey = "shot"
    static let defKey = "def"
    static let shortPassKey = "shortPass"
    static let longPassKey = "longPass"
    static let headPlayKey = "headPlay"
    static let driblingKey = "dribling"
    static let staminaKey = "stamina"
    static let physicsKey = "physics"
    static let motivationKey = "motivation"
    static let expirienceKey = "expirience"
    static let speedKey = "speed"
    static let jumpKey = "jump"
    static let ballWinningKey = "ballWinning"
    static let reflexesKey = "reflexes"
    
    
    var playerImage: String = ""
    var playerName: String = ""
    var nationality: String = ""
    var playerPosition: String = ""
    var attackingProwess: String = "0"
    var defensiveProwess: String = "0"
    var ballControll: String = "0"
    var shot: String = "0"
    var def: String = "0"
    var shortPass: String = "0"
    var longPass: String = "0"
    var headPlay: String = "0"
    var dribling: String = "0"
    var stamina: String = "0"
    var physics: String = "0"
    var motivation: String = "0"
    var expirience: String = "0"
    var speed: String = "0"
    var jump: String = "0"
    var ballWinning: String = "0"
    var reflexes: String = "0"
    
    class func fromModelToDict(player: Player) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = [Player.playerNameKey: player.playerName,
                          Player.playerImageKey: player.playerImage,
                          Player.playerNationalityKey: player.nationality,
                          Player.playerPositionKey: player.playerPosition,
                          Player.attackingProwessKey: player.attackingProwess,
                          Player.defensiveProwessKey: player.defensiveProwess,
                          Player.ballControllKey: player.ballControll,
                          Player.shotKey: player.shot,
                          Player.defKey: player.def,
                          Player.shortPassKey: player.shortPass,
                          Player.longPassKey: player.longPass,
                          Player.headPlayKey: player.headPlay,
                          Player.driblingKey: player.dribling,
                          Player.staminaKey: player.stamina,
                          Player.physicsKey: player.physics,
                          Player.motivationKey: player.motivation,
                          Player.expirienceKey: player.expirience,
                          Player.speedKey: player.speed,
                          Player.jumpKey: player.jump,
                          Player.ballWinningKey: player.ballWinning,
                          Player.reflexesKey: player.reflexes] as [String : Any]
        dict = [player.playerName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Player {
        let player = Player()
        if let playerName = dictionary[Player.playerNameKey] as? String {
            player.playerName = playerName
        }
        if let playerImage = dictionary[Player.playerImageKey] as? String {
            player.playerImage = playerImage
        }
        if let nationality = dictionary[Player.playerNationalityKey] as? String {
            player.nationality = nationality
        }
        if let playerPosition = dictionary[Player.playerPositionKey] as? String {
            player.playerPosition = playerPosition
        }
        if let attackingProwess = dictionary[Player.attackingProwessKey] as? String {
            player.attackingProwess = attackingProwess
        }
        if let defensiveProwess = dictionary[Player.defensiveProwessKey] as? String {
            player.defensiveProwess = defensiveProwess
        }
        if let ballControll = dictionary[Player.ballControllKey] as? String {
            player.ballControll = ballControll
        }
        if let shot = dictionary[Player.shotKey] as? String {
            player.shot = shot
        }
        if let def = dictionary[Player.defKey] as? String {
            player.def = def
        }
        if let shortPass = dictionary[Player.shortPassKey] as? String {
            player.shortPass = shortPass
        }
        if let longPass = dictionary[Player.longPassKey] as? String {
            player.longPass = longPass
        }
        if let headPlay = dictionary[Player.headPlayKey] as? String {
            player.headPlay = headPlay
        }
        if let dribling = dictionary[Player.driblingKey] as? String {
            player.dribling = dribling
        }
        if let stamina = dictionary[Player.staminaKey] as? String {
            player.stamina = stamina
        }
        if let physics = dictionary[Player.physicsKey] as? String {
            player.physics = physics
        }
        if let motivation = dictionary[Player.motivationKey] as? String {
            player.motivation = motivation
        }
        if let expirience = dictionary[Player.expirienceKey] as? String {
            player.expirience = expirience
        }
        if let speed = dictionary[Player.speedKey] as? String {
            player.speed = speed
        }
        if let jump = dictionary[Player.jumpKey] as? String {
            player.jump = jump
        }
        if let ballWinning = dictionary[Player.ballWinningKey] as? String {
            player.ballWinning = ballWinning
        }
        if let reflexes = dictionary[Player.reflexesKey] as? String {
            player.reflexes = reflexes
        }
        
        return player
    }
}

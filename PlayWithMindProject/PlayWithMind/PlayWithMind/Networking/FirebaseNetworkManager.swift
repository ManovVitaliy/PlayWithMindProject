//
//  FirebaseNetworkManager.swift
//  PlayWithMind
//
//  Created by user on 7/10/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirebaseNetworkManager {
    
    static let sharedInstance = FirebaseNetworkManager()
    
    //constants
    private let keyCountry = "Country"
    private let keyChampionat = "Championat"
    private let keyTeam = "Team"
    private let keyPlayer = "Player"
    
    //MARK: - GET
    
    func getCountries(completion: @escaping((_ countriesArray: [Country]?) -> Void)) {
        let firebaseCountry = Database.database().reference().child(keyCountry)
        firebaseCountry.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataDict = data as? [String: AnyObject] {
                    let keys = dataDict.keys
                    var countryArray = [Country]()
                    for key in keys {
                        let dict = dataDict[key] as! [String: AnyObject]
                        let country = Country.fromDictToModel(dictionary: dict)
                        countryArray.append(country)
                    }
                    completion(countryArray)
                    firebaseCountry.removeAllObservers()
                } else {
                    completion(nil)
                    firebaseCountry.removeAllObservers()
                }
            } else {
                completion(nil)
                firebaseCountry.removeAllObservers()
            }
        }
    }
    
    func getChampionats(countryName: String, completion: @escaping((_ championatArray: [Championat]?) -> Void)) {
        let firebaseChampionat = Database.database().reference().child(keyChampionat)
        let firebaseChampionatsForCountry = firebaseChampionat.child(countryName)
        firebaseChampionatsForCountry.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataDict = data as? [String: AnyObject] {
                    let keys = dataDict.keys
                    var championatArray = [Championat]()
                    for key in keys {
                        let dict = dataDict[key] as! [String: AnyObject]
                        let championat = Championat.fromDictToModel(dictionary: dict)
                        championatArray.append(championat)
                    }
                    completion(championatArray)
                    firebaseChampionatsForCountry.removeAllObservers()
                } else {
                    completion(nil)
                    firebaseChampionatsForCountry.removeAllObservers()
                }
            } else {
                completion(nil)
                firebaseChampionatsForCountry.removeAllObservers()
            }
        }
    }
    
    func getTeams(championatName: String, completion: @escaping((_ teamArray: [Team]?) -> Void)) {
        let firebaseTeam = Database.database().reference().child(keyTeam)
        let firebaseTeamsForChampionat = firebaseTeam.child(championatName)
        firebaseTeamsForChampionat.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataDict = data as? [String: AnyObject] {
                    let keys = dataDict.keys
                    var teamArray = [Team]()
                    for key in keys {
                        let dict = dataDict[key] as! [String: AnyObject]
                        let team = Team.fromDictToModel(dictionary: dict)
                        teamArray.append(team)
                    }
                    completion(teamArray)
                    firebaseTeamsForChampionat.removeAllObservers()
                } else {
                    completion(nil)
                    firebaseTeamsForChampionat.removeAllObservers()
                }
            } else {
                completion(nil)
                firebaseTeamsForChampionat.removeAllObservers()
            }
        }
    }
    
    func getPlayers(teamName: String, completion: @escaping((_ playerArray: [Player]?) -> Void)) {
        let firebasePlayer = Database.database().reference().child(keyPlayer)
        let firebasePlayersForTeam = firebasePlayer.child(teamName)
        firebasePlayersForTeam.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataDict = data as? [String: AnyObject] {
                    let keys = dataDict.keys
                    var playersArray = [Player]()
                    for key in keys {
                        let dict = dataDict[key] as! [String: AnyObject]
                        let player = Player.fromDictToModel(dictionary: dict)
                        playersArray.append(player)
                    }
                    completion(playersArray)
                    firebasePlayersForTeam.removeAllObservers()
                } else {
                    completion(nil)
                    firebasePlayersForTeam.removeAllObservers()
                }
            } else {
                completion(nil)
                firebasePlayersForTeam.removeAllObservers()
            }
        }
    }
    
    func getSections(completion: @escaping((_ sectionArray: [Section]?) -> Void)) {
        let firebaseChampionat = Database.database().reference().child(keyChampionat)
        firebaseChampionat.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value as? [String: AnyObject] {
                let sectionsArray = Section.fromDictToModel(dictionary: data)
                completion(sectionsArray)
                firebaseChampionat.removeAllObservers()
            } else {
                completion(nil)
                firebaseChampionat.removeAllObservers()
            }
        }
    }
    
}

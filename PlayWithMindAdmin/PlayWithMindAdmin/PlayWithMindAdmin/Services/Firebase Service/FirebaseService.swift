//
//  FirebaseService.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirebaseService: NSObject {

    static let sharedInstance = FirebaseService()
    
    //constants
    private let keyCountry = "Country"
    private let keyChampionat = "Championat"
    private let keyTeam = "Team"
    
    //MARK: - GET
    
    func getCountries(completion: @escaping((_ countriesArray: [String]?) -> Void)) {
        let firebaseCountry = Database.database().reference().child(keyCountry)
        firebaseCountry.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataArray = data as? [String] {
                    completion(dataArray)
                } else {
                    completion(nil)
                }
                
            }
        }
    }
    
    func getChampionats(countryName: String, completion: @escaping((_ championatArray: [Championat]?) -> Void)) {
        let firebaseChampionat = Database.database().reference().child(keyChampionat)
        let firebaseChampionatsForCountry = firebaseChampionat.child(countryName)
        firebaseChampionatsForCountry.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataArray = data as? [String] {
                    var championatsArray = [Championat]()
                    for champName in dataArray {
                        let championat = Championat()
                        championat.championatName = champName
                        championatsArray.append(championat)
                    }
                    completion(championatsArray)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    func getTeams(championatName: String, completion: @escaping((_ teamArray: [Team]?) -> Void)) {
        let firebaseTeam = Database.database().reference().child(keyTeam)
        let firebaseteamssForChampionat = firebaseTeam.child(championatName)
        firebaseteamssForChampionat.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataArray = data as? [String] {
                    var teamsArray = [Team]()
                    for teamName in dataArray {
                        let team = Team()
                        team.teamName = teamName
                        teamsArray.append(team)
                    }
                    completion(teamsArray)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: - POST
    
    func postCountry(countryName: String, completion: @escaping(() -> Void)) {
        let firebaseCountry = Database.database().reference().child(keyCountry)
        firebaseCountry.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            if var countryArray = snapshot.value as? [String] {
                countryArray.append(countryName)
                firebaseCountry.setValue(countryArray)
                completion()
            } else {
                firebaseCountry.setValue([countryName])
                completion()
            }
        }
    }
    
    func postChampionat(countryName: String, championatName: String, completion: @escaping(() -> Void)) {
        let firebaseChampionat = Database.database().reference().child(keyChampionat)
        let firebaseChampionatsForCountry = firebaseChampionat.child(countryName)
        firebaseChampionatsForCountry.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            if var championatsArray = snapshot.value as? [String] {
                championatsArray.append(championatName)
                firebaseChampionatsForCountry.setValue(championatsArray)
                completion()
            } else {
                firebaseChampionatsForCountry.setValue([championatName])
                completion()
            }
        }
    }
    
    func postTeam(championatName: String, teamName: String, completion: @escaping(() -> Void)) {
        let firebaseTeam = Database.database().reference().child(keyTeam)
        let firebaseTeamForChampionat = firebaseTeam.child(championatName)
        firebaseTeamForChampionat.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            if var teamsArray = snapshot.value as? [String] {
                teamsArray.append(teamName)
                firebaseTeamForChampionat.setValue(teamsArray)
                completion()
            } else {
                firebaseTeamForChampionat.setValue([teamName])
                completion()
            }
        }
    }
    
    //MARK: - UPDATE
    
}

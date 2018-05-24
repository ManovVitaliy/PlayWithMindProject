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
    
    // GET
    
    func getChampionats(completion: @escaping((_ championatArray: [Championat]?) -> Void)) {
        let firebase = Database.database().reference().child(keyChampionat)
        firebase.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataArray = data as? [String] {
                    var championatsArray = [Championat]()
                    for champName in dataArray {
                        let championat = Championat()
                        championat.championatName = champName
                        championatsArray.append(championat)
                    }
                    completion(championatsArray)
                }
            }
        }
    }
    
    func getCountries(completion: @escaping((_ countriesArray: [String]?) -> Void)) {
        let firebase = Database.database().reference().child(keyCountry)
        firebase.observe(DataEventType.value) { (snapshot) in
            if let data = snapshot.value {
                if let dataArray = data as? [String] {
                    completion(dataArray)
                } else {
                    completion(nil)
                }
                
            }
        }
    }
    
    // POST
    
    func postCountry(countryName: String, completion: @escaping(() -> Void)) {
        let firebase = Database.database().reference().child(keyCountry)
        firebase.observeSingleEvent(of: DataEventType.value) { [weak self] (snapshot) in
            if var countryArray = snapshot.value as? [String] {
                countryArray.append(countryName)
                if let keyCountry = self?.keyCountry {
                    firebase.setValue([keyCountry: countryArray])
                    completion()
                } else {
                    completion()
                }
            } else {
                completion()
            }
        }
    }
    
    // UPDATE
    
}

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
    
    func getChampionats(completion: @escaping((_ championatArray: [Championat]?) -> Void)) {
        let firebase = Database.database().reference().child("Championat")
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
    
}

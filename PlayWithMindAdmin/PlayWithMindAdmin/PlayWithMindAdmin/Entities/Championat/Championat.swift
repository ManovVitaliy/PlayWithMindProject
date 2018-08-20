//
//  Championat.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Championat {
    
    // MARK: - keys
    static let championatImageKey = "championatImage"
    static let championatNameKey = "championatName"
    
    //MARK: - properties
    var championatImage: String = ""
    var championatName: String = ""
    
    // convert model Championat to dictionary
    class func fromModelToDict(championat: Championat) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = [championatNameKey: championat.championatName,
                          championatImageKey: championat.championatImage]
        dict = [championat.championatName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    // convert dictionary to Championat
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Championat {
        let championat = Championat()
        if let championatName = dictionary[championatNameKey] as? String {
            championat.championatName = championatName
        }
        if let championatImage = dictionary[championatImageKey] as? String {
            championat.championatImage = championatImage
        }
        
        return championat
    }
}

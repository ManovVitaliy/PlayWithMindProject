//
//  Championat.swift
//  PlayWithMind
//
//  Created by user on 7/10/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Championat {
    var championatImage: String = ""
    var championatName: String = ""
    
    class func fromModelToDict(championat: Championat) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = ["name": championat.championatName,
                          "image": championat.championatImage]
        dict = [championat.championatName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Championat {
        let championat = Championat()
        if let championatName = dictionary["name"] as? String {
            championat.championatName = championatName
        }
        if let championatImage = dictionary["image"] as? String {
            championat.championatImage = championatImage
        }
        
        return championat
    }
}

//
//  Country.swift
//  PlayWithMind
//
//  Created by user on 7/10/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Country {
    var countryImage: String = ""
    var countryName: String = ""
    
    class func fromModelToDict(country: Country) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = ["name": country.countryName,
                          "image": country.countryImage]
        dict = [country.countryName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Country {
        let country = Country()
        if let countryName = dictionary["name"] as? String {
            country.countryName = countryName
        }
        if let countryImage = dictionary["image"] as? String {
            country.countryImage = countryImage
        }
        
        return country
    }
}

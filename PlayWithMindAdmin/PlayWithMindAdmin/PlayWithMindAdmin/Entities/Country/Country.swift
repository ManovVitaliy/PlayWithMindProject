//
//  Country.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/25/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Country {
    
    static let countryNameKey = "countryName"
    static let countryImageKey = "countryImage"
    
    var countryImage: String = ""
    var countryName: String = ""
    
    class func fromModelToDict(country: Country) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = [Country.countryNameKey: country.countryName,
                          Country.countryImageKey: country.countryImage]
        dict = [country.countryName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    class func fromDictToModel(dictionary: [String: AnyObject]) -> Country {
        let country = Country()
        if let countryName = dictionary[Country.countryNameKey] as? String {
            country.countryName = countryName
        }
        if let countryImage = dictionary[Country.countryImageKey] as? String {
            country.countryImage = countryImage
        }
        
        return country
    }
}

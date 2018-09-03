//
//  Country.swift
//  PlayWithMind
//
//  Created by user on 7/10/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Country {
    
    //MARK: - keys
    static let countryNameKey = "countryName"
    static let countryImageKey = "countryImage"
    
    //MARK: - properties
    var countryImage: String = ""
    var countryName: String = ""
    
    // convert model Player to dictionary
    class func fromModelToDict(country: Country) -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let dictHelper = [Country.countryNameKey: country.countryName,
                          Country.countryImageKey: country.countryImage]
        dict = [country.countryName: dictHelper] as [String : AnyObject]
        
        return dict
    }
    
    // convert dictionary to Player
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

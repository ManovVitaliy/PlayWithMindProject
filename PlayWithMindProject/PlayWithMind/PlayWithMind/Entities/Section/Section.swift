//
//  Section.swift
//  PlayWithMind
//
//  Created by user on 7/10/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Section {
    var name: String
    var items: [String]
    var collapsed: Bool
    
    init(name: String, items: [String], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
    
    class func fromDictToModel(dictionary: [String: AnyObject]) -> [Section] {
        var sections = [Section]()
        let allKeys = Array(dictionary.keys)
        for key in allKeys {
            if let dict = dictionary[key] as? [String: AnyObject] {
                let championatsArray = Array(dict.keys)
                let section = Section(name: key, items: championatsArray)
                sections.append(section)
            }
        }
        return sections
    }
}

//
//  FootbalTeamSchemeModel.swift
//  PlayWithMind
//
//  Created by user on 8/8/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import Foundation
class FootbalTeamSchemeModel {
    var teamSchemesArray = [Scheme]()
    
    init() {
        getArray()
    }
    
    private func getArray(){
        let scheme1 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 3,
                             fourthLine: 1,
                             fifthLine: 2).self
        let scheme2 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 3,
                             fourthLine: 3,
                             fifthLine: nil).self
        let scheme3 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 4,
                             fourthLine: 2,
                             fifthLine: nil).self
        let scheme4 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 1,
                             fourthLine: 4,
                             fifthLine: 1).self
        let scheme5 = Scheme(firstLine: 1,
                             secondLine: 3,
                             thirdLine: 4,
                             fourthLine: 3,
                             fifthLine: nil).self
        let scheme6 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 4,
                             fourthLine: 1,
                             fifthLine: 1).self
        let scheme7 = Scheme(firstLine: 1,
                             secondLine: 5,
                             thirdLine: 3,
                             fourthLine: 2,
                             fifthLine: nil).self
        let scheme8 = Scheme(firstLine: 1,
                             secondLine: 4,
                             thirdLine: 3,
                             fourthLine: 2,
                             fifthLine: 1).self
        
        teamSchemesArray.append(scheme1)
        teamSchemesArray.append(scheme2)
        teamSchemesArray.append(scheme3)
        teamSchemesArray.append(scheme4)
        teamSchemesArray.append(scheme5)
        teamSchemesArray.append(scheme6)
        teamSchemesArray.append(scheme7)
        teamSchemesArray.append(scheme8)
    }
}

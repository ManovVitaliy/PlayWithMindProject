//
//  Scheme.swift
//  PlayWithMind
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class Scheme: NSObject {
    var schemeName: String = ""
    var firstLine: Int?
    var secondLine: Int?
    var thirdLine: Int?
    var fourthLine: Int?
    var fifthLine: Int?
    
    init(firstLine: Int?, secondLine: Int?, thirdLine: Int?, fourthLine: Int?, fifthLine: Int?) {
        self.firstLine = firstLine
        self.secondLine = secondLine
        self.thirdLine = thirdLine
        self.fourthLine = fourthLine
        self.fifthLine = fifthLine
        if let secondL = secondLine, let thirdL = thirdLine, let fourthL = fourthLine {
            self.schemeName = "\(String(describing: secondL))-\(String(describing: thirdL))-\(String(describing: fourthL))"
        }
        if let fifthL = fifthLine {
            self.schemeName = self.schemeName + "-\(String(describing: fifthL))"
            
        }
    }
}

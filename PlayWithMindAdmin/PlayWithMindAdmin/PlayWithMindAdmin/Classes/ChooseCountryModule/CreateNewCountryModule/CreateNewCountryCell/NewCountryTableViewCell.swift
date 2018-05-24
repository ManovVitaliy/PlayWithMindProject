//
//  NewCountryTableViewCell.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class NewCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.countryTextField.layer.cornerRadius = 2
        self.countryTextField.layer.borderWidth = 2
        self.countryTextField.layer.borderColor = UIColor.black.cgColor
        self.countryTextField.layer.masksToBounds = true
    }
}

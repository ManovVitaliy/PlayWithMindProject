//
//  NewCountryTableViewCell.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class AbstractNewItemTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var itemCellLabel: UILabel!
    @IBOutlet weak var itemCellTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.itemCellTextField.layer.cornerRadius = 2
        self.itemCellTextField.layer.borderWidth = 2
        self.itemCellTextField.layer.borderColor = UIColor.black.cgColor
        self.itemCellTextField.layer.masksToBounds = true
        itemCellTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.itemCellTextField {
            self.itemCellTextField.resignFirstResponder()
        }
        return true
    }
    
}

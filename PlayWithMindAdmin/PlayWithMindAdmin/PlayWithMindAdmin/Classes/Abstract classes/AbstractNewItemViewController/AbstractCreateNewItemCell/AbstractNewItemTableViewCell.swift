//
//  NewCountryTableViewCell.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class AbstractNewItemTableViewCell: UITableViewCell, UITextFieldDelegate {

    //MARK: - outlets
    @IBOutlet weak var itemCellLabel: UILabel!
    @IBOutlet weak var itemCellTextField: UITextField!
    
    var delegate: UpdateDictionary!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.itemCellTextField.layer.cornerRadius = 2
        self.itemCellTextField.layer.borderWidth = 2
        self.itemCellTextField.layer.borderColor = UIColor.black.cgColor
        self.itemCellTextField.layer.masksToBounds = true
        itemCellTextField.delegate = self
        self.itemCellTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.itemCellTextField {
            self.itemCellTextField.resignFirstResponder()
        }
        return true
    }
    
    func fillCell(key: String, value: String) {
        self.itemCellLabel.text = key
        self.itemCellTextField.text = value
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let key = self.itemCellLabel.text, let value = self.itemCellTextField.text {
            delegate.updateDict(key: key, value: value)
        }
    }
    
}

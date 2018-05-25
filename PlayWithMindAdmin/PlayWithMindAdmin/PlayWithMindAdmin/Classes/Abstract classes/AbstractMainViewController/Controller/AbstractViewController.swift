//
//  AbstractViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController {
    
    var createButton = UIButton()
    var updateButton = UIButton()
    
    let cellIdentifier = "ChooseItemTableViewCell"
    
    //MARK: - view controller's lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Abstract Controller"
        
        createButton = UIButton(type: .custom)
        createButton.setImage(UIImage(named: "add-icon"), for: .normal)
        createButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        createButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        createButton.addTarget(self, action: #selector(createButtonTappaed), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: createButton)
        
        updateButton = UIButton(type: .custom)
        updateButton.setImage(UIImage(named: "update-icon"), for: .normal)
        updateButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        updateButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        updateButton.addTarget(self, action: #selector(updateButtonTappaed), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: updateButton)
        
        self.navigationItem.setRightBarButtonItems([item1,item2], animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    func createButtonHidden(hidden: Bool) {
        self.createButton.isHidden = hidden
    }
    
    func updateButtonHidden(hidden: Bool) {
        self.updateButton.isHidden = hidden
    }
    
    @objc func createButtonTappaed() {
        print("btn1 abstract Tapped")
    }
    
    @objc func updateButtonTappaed() {
        print("btn2 abstract Tapped")
    }
    
}

//
//  AbstractViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController {
    
    var btn1 = UIButton()
    var btn2 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AbstractViewController"
        
        btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "add-icon"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(btn1Tappaed), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
        btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "update-icon"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn2.addTarget(self, action: #selector(btn2Tappaed), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.setRightBarButtonItems([item1,item2], animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    func btn1Hidden(hidden: Bool) {
        self.btn1.isHidden = hidden
    }
    
    func btn2Hidden(hidden: Bool) {
        self.btn2.isHidden = hidden
    }
    
    @objc func btn1Tappaed() {
        print("btn1 abstract Tapped")
    }
    
    @objc func btn2Tappaed() {
        print("btn2 abstract Tapped")
    }
    
}

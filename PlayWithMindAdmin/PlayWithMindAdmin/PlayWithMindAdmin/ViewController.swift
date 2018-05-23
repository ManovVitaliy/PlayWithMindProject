//
//  ViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firebase = Database.database().reference().child("table")
        firebase.setValue(["keyAdmin": "newValueAdmin"])
    }
}


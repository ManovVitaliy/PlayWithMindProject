//
//  CreateNewPlayerViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/25/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class CreateNewPlayerViewController: AbstractNewItemViewController {

    var teamName = ""
    var playerDictionary = ["name" : "",
                            "image": "",
                            "power": "",
                            "shot": "",
                            "pass": ""]
    
    //MARK: - view controller's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.titleLabel.text = "New Player"
    }
    
    override func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "AbstractNewItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerDictionary.keys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AbstractNewItemTableViewCell
        
        let keysArray = Array(playerDictionary.keys)
        
        cell.itemCellLabel.text = keysArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - tableView delegate
    
    //MARK: - actions
    
    override func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func saveButtonTapped(_ sender: Any) {
        var playerDict = [String: String]()
        var keyName = ""
        for i in 0..<playerDictionary.keys.count {
            if let cell = self.tableView.cellForRow(at: IndexPath(item: i, section: 0)) as? AbstractNewItemTableViewCell {
                if let newValue = cell.itemCellTextField.text, let newKey = cell.itemCellLabel.text {
                    if newKey == "name" {
                        keyName = newValue
                    }
                    playerDict[newKey] = newValue
                }
            }
        }
        
        let finalDict = [keyName: playerDict]
        
        FirebaseService.sharedInstance.postPlayer(teamName: teamName, player: finalDict as [String : AnyObject]) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

//
//  CreateNewPlayerViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/25/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class CreateNewPlayerViewController: AbstractNewItemViewController {

    // MARK: - properties
    var teamName = ""
    
    // update dataSource for tableView
    func currentDictionary() {
        itemDictionary = [Player.playerImageKey: "",
                          Player.playerNameKey: "",
                          Player.playerNationalityKey: "",
                          Player.playerPositionKey: "",
                          Player.attackingProwessKey: "0",
                          Player.defensiveProwessKey: "0",
                          Player.ballControllKey: "0",
                          Player.shotKey: "0",
                          Player.shortPassKey: "0",
                          Player.longPassKey: "0",
                          Player.headPlayKey: "0",
                          Player.driblingKey: "0",
                          Player.staminaKey: "0",
                          Player.physicsKey: "0",
                          Player.motivationKey: "0",
                          Player.expirienceKey: "0",
                          Player.speedKey: "0",
                          Player.jumpKey: "0",
                          Player.ballWinningKey: "0",
                          Player.reflexesKey: "0"] as [String : AnyObject]
    }
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.titleLabel.text = "New Player"
        currentDictionary()
    }
    
    override func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "AbstractNewItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemDictionary.keys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! AbstractNewItemTableViewCell

        return cell
    }
    
    //MARK: - tableView delegate
    
    //MARK: - actions
    override func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // write new player to data base
    override func saveButtonTapped(_ sender: Any) {
        let keysArray = Array(itemDictionary.keys)
        for key in keysArray {
            let value = itemDictionary[key] as! String
            guard value != "" else {
                self.allFieldsHaveToBeFullAlert()
                return
            }
            
        }
        let player = Player.fromDictToModel(dictionary: itemDictionary)
        
        FirebaseService.sharedInstance.postPlayer(teamName: teamName, player: player) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

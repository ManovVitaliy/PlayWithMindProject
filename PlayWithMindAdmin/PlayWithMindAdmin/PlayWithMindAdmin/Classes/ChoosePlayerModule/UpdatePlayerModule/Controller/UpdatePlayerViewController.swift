//
//  UpdatePlayerViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 8/6/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class UpdatePlayerViewController: AbstractNewItemViewController {
    
    var teamName = ""
    var player = Player()

    func currentDictionary() {
        itemDictionary = [Player.playerNameKey: player.playerName,
                          Player.playerImageKey: player.playerImage,
                          Player.playerNationalityKey: player.nationality,
                          Player.playerPositionKey: player.playerPosition,
                          Player.attackingProwessKey: player.attackingProwess,
                          Player.defensiveProwessKey: player.defensiveProwess,
                          Player.ballControllKey: player.ballControll,
                          Player.shotKey: player.shot,
                          Player.defKey: player.def,
                          Player.shortPassKey: player.shortPass,
                          Player.longPassKey: player.longPass,
                          Player.headPlayKey: player.headPlay,
                          Player.driblingKey: player.dribling,
                          Player.staminaKey: player.stamina,
                          Player.physicsKey: player.physics,
                          Player.motivationKey: player.motivation,
                          Player.expirienceKey: player.expirience,
                          Player.speedKey: player.speed,
                          Player.jumpKey: player.jump,
                          Player.ballWinningKey: player.ballWinning,
                          Player.reflexesKey: player.reflexes] as [String : AnyObject]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.saveButton.setTitle("UPDATE", for: .normal)
        self.titleLabel.text = player.playerName
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
        
        if cell.itemCellLabel.text == Team.teamNameKey {
            cell.itemCellTextField.isEnabled = false
        }
        
        return cell
    }
    
    //MARK: - actions
    
    override func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func saveButtonTapped(_ sender: Any) {
        let keysArray = Array(itemDictionary.keys)
        for key in keysArray {
            var valueDict = ""
            
            if let value = itemDictionary[key] as? String {
                valueDict = value
            } else if let intValue = itemDictionary[key] as? Int {
                valueDict = String(intValue)
            }
            
            guard valueDict != "" else {
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

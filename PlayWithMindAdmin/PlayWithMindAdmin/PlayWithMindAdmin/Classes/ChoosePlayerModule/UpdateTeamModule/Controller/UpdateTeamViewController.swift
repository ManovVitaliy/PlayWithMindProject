//
//  UpdateTeamViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/25/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class UpdateTeamViewController: AbstractNewItemViewController {

    //MARK: - properties
    var teamName = ""
    var championatName = ""
    
    // update dataSource for tableView
    func currentDictionary() {
        itemDictionary = [Team.teamNameKey: self.teamName,
                          Team.teamImageKey: "",
                          Team.coachPowerKey: "0",
                          Team.coachNameKey: "",
                          Team.coachImageKey: "",
                          Team.teamMotivationKey: "0",
                          Team.teamCollaborationKey: "0",
                          Team.teamSchemeKey: "",
                          Team.teamStandartsGameKey: "0",
                          Team.teamSurrenderKey: "0",
                          Team.teamCharacterKey: "0",
                          Team.teamBenchLengthKey: "0"] as [String : AnyObject]
    }
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.saveButton.setTitle("UPDATE", for: .normal)
        self.titleLabel.text = teamName
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
    
    // update team's parametrs and save them to firebase
    override func saveButtonTapped(_ sender: Any) {
        let keysArray = Array(itemDictionary.keys)
        for key in keysArray {
            let value = itemDictionary[key] as! String
            guard value != "" else {
                self.allFieldsHaveToBeFullAlert()
                return
            }
            
        }
        let team = Team.fromDictToModel(dictionary: itemDictionary)
        
        FirebaseService.sharedInstance.postTeam(championatName: championatName, team: team) {
            self.dismiss(animated: true, completion: nil)
        }
    }

}

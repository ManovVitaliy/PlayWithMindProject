//
//  CreateNewTeamViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class CreateNewTeamViewController: AbstractNewItemViewController {

    var championatName = ""
    
    func currentDictionary() {
        itemDictionary = [Team.teamNameKey: "",
                          Team.teamImageKey: "",
                          Team.coachPowerKey: "",
                          Team.teamMotivationKey: "",
                          Team.teamCollaborationKey: "",
                          Team.teamSchemeKey: ""] as [String : AnyObject]
    }
    
    //MARK: - view controller's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.titleLabel.text = "New Team"
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
    
    //MARK: - actions
    
    override func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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

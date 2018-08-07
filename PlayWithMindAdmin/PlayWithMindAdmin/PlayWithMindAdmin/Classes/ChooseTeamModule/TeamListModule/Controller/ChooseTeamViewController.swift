//
//  ChooseTeamViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class ChooseTeamViewController: AbstractViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var chooseTeamTableView: UITableView!
    
    var championat: String = ""
    
    var teamsArray = [Team]()
    
    //MARK: - view controller's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        FirebaseService.sharedInstance.getTeams(championatName: championat) { [weak self] (teamArr) in
            if let teamsArray = teamArr {
                self?.teamsArray = teamsArray
                self?.chooseTeamTableView.reloadData()
            }
        }
        self.title = championat
        self.updateButtonHidden(hidden: true)
    }
    
    private func setupTableView() {
        self.chooseTeamTableView.dataSource = self
        self.chooseTeamTableView.delegate = self
        self.chooseTeamTableView.register(UINib(nibName: "ChooseItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teamsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseTeamTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseItemTableViewCell
        cell.championatNameLabel.text = self.teamsArray[indexPath.row].teamName
        return cell
    }
    
    //MARK: - tableView delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTeamName = self.teamsArray[indexPath.row].teamName
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let playerListVC = storyboard.instantiateViewController(withIdentifier: "ChoosePlayerViewController") as! ChoosePlayerViewController
        playerListVC.team = selectedTeamName
        playerListVC.championatName = championat
        self.navigationController?.pushViewController(playerListVC, animated: true)
    }
    
    //MARK: - actions
    
    override func createButtonTappaed() {
        let createNewTeamVC = CreateNewTeamViewController.init(nibName: "AbstractNewItemViewController", bundle: nil)
        createNewTeamVC.championatName = self.championat
        
        self.present(createNewTeamVC, animated: true, completion: nil)
    }
}

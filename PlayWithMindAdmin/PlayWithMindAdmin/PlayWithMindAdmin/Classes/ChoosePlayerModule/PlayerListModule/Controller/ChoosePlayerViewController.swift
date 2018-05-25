//
//  ChoosePlayerViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/25/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class ChoosePlayerViewController: AbstractViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var choosePlayerTableView: UITableView!
    
    var team: String = ""
    
    var playersArray = [Player]()
    
    //MARK: - view controller's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        FirebaseService.sharedInstance.getPlayers(teamName: team) { [weak self] (playerArr) in
            if let playersArray = playerArr {
                self?.playersArray = playersArray
                self?.choosePlayerTableView.reloadData()
            }
        }
        self.title = team
    }
    
    private func setupTableView() {
        self.choosePlayerTableView.dataSource = self
        self.choosePlayerTableView.delegate = self
        self.choosePlayerTableView.register(UINib(nibName: "ChooseItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.choosePlayerTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseItemTableViewCell
        cell.championatNameLabel.text = self.playersArray[indexPath.row].playerName
        return cell
    }
    
    //MARK: - actions
    
    override func createButtonTappaed() {
        let createNewPlayerVC = CreateNewPlayerViewController.init(nibName: "AbstractNewItemViewController", bundle: nil)
        createNewPlayerVC.teamName = self.team
        
        self.present(createNewPlayerVC, animated: true, completion: nil)
    }
    
    override func updateButtonTappaed() {
        let updateTeamVC = UpdateTeamViewController.init(nibName: "AbstractNewItemViewController", bundle: nil)
        updateTeamVC.teamName = self.team
        
        self.present(updateTeamVC, animated: true, completion: nil)
    }
}

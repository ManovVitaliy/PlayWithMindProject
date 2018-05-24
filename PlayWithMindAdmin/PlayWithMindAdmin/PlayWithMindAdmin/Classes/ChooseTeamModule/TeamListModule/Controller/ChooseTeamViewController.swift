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
    
    //constants
    private let cellIdentifier = "ChooseItemTableViewCell"
    
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
    
    //MARK: - actions
    
    override func createButtonTappaed() {
        let createNewChampionatVC = CreateNewTeamViewController.init(nibName: "AbstractNewItemViewController", bundle: nil)
        createNewChampionatVC.championatName = self.championat
        
        self.present(createNewChampionatVC, animated: true, completion: nil)
    }
}

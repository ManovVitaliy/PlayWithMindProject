//
//  ViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChooseChampionatViewController: AbstractViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var chooseChampionatTableView: UITableView!
    
    //constants
    private let cellIdentifier = "ChooseItemTableViewCell"
    
    var country: String = ""
    
    var champsArray = [Championat]()
    
    //MARK: - view controller's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
        FirebaseService.sharedInstance.getChampionats(countryName: self.country) { [weak self] (championatArray) in
            if let championatArray = championatArray {
                self?.champsArray = championatArray
                self?.chooseChampionatTableView.reloadData()
            }
        }
        self.title = country
        self.updateButtonHidden(hidden: true)
    }
    
    private func setupTableView() {
        self.chooseChampionatTableView.dataSource = self
        self.chooseChampionatTableView.delegate = self
        self.chooseChampionatTableView.register(UINib(nibName: "ChooseItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.champsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseChampionatTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseItemTableViewCell
        cell.championatNameLabel.text = self.champsArray[indexPath.row].championatName
        return cell
    }
    
    //MARK: - tableView delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedChampionatName = self.champsArray[indexPath.row].championatName
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let teamListVC = storyboard.instantiateViewController(withIdentifier: "ChooseTeamViewController") as! ChooseTeamViewController
        teamListVC.championat = selectedChampionatName
        self.navigationController?.pushViewController(teamListVC, animated: true)
    }
    
    //MARK: - actions
    
    override func createButtonTappaed() {
        let createNewChampionatVC = CreateNewChampionatViewController.init(nibName: "AbstractNewItemViewController", bundle: nil)
        createNewChampionatVC.countryName = self.country
        
        self.present(createNewChampionatVC, animated: true, completion: nil)
    }
    
}


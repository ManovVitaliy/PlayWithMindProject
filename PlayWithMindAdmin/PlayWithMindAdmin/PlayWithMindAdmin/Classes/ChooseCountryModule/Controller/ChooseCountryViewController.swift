//
//  ChooseCountryViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class ChooseCountryViewController: AbstractViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var chooseCountryTableView: UITableView!
    
    //constants
    private let cellIdentifier = "ChooseChampionatTableViewCell"
    private let navTtitle = "Choose country"
    
    var countriesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupTableView()
        
        FirebaseService.sharedInstance.getCountries { [weak self] (countriesArray) in
            if let countrArray = countriesArray {
                self?.countriesArray = countrArray
                self?.chooseCountryTableView.reloadData()
            }
        }
    }
    
    private func setupNavigationBar() {
        self.title = navTtitle
        self.createButtonHidden(hidden: false)
        self.updateButtonHidden(hidden: true)
    }
    
    private func setupTableView() {
        self.chooseCountryTableView.dataSource = self
        self.chooseCountryTableView.delegate = self
        self.chooseCountryTableView.register(UINib(nibName: "ChooseChampionatTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseCountryTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseChampionatTableViewCell
        cell.championatNameLabel.text = self.countriesArray[indexPath.row]
        return cell
    }
    
    override func createButtonTappaed() {
        let createNewCountryVC = CreateNewCountryViewController.init(nibName: "CreateNewCountryViewController", bundle: nil)
        
        self.present(createNewCountryVC, animated: true, completion: nil)
    }
}

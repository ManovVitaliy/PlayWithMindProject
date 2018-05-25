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
    private let navTtitle = "Choose country"
    
    var countriesArray = [String]()
    
    //MARK: - view controller's lifecycle
    
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
        self.chooseCountryTableView.register(UINib(nibName: "ChooseItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseCountryTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseItemTableViewCell
        cell.championatNameLabel.text = self.countriesArray[indexPath.row]
        return cell
    }
    
    //MARK: - tableView delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountryName = self.countriesArray[indexPath.row]
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let championatListVC = storyboard.instantiateViewController(withIdentifier: "ChooseChampionatViewController") as! ChooseChampionatViewController
        championatListVC.country = selectedCountryName
        self.navigationController?.pushViewController(championatListVC, animated: true)
    }
    
    //MARK: - actions
    
    override func createButtonTappaed() {
        let createNewCountryVC = CreateNewCountryViewController.init(nibName: "AbstractNewItemViewController", bundle: nil)
        
        self.present(createNewCountryVC, animated: true, completion: nil)
    }
}

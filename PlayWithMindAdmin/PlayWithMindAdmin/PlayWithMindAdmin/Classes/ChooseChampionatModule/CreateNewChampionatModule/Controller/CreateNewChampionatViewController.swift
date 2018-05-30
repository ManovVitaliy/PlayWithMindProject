//
//  CreateNewChampionatViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class CreateNewChampionatViewController: AbstractNewItemViewController {
    
    var countryName = ""

    //MARK: - view controller's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    override func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "AbstractNewItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AbstractNewItemTableViewCell
        
        cell.itemCellLabel.text = "Championat"
        
        return cell
    }
    
    //MARK: - tableView delegate
    
    //MARK: - actions
    
    override func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func saveButtonTapped(_ sender: Any) {
        if let cell = self.tableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? AbstractNewItemTableViewCell {
            if let newChampionatName = cell.itemCellTextField.text {
                let championat = Championat()
                championat.championatName = newChampionatName
                championat.championatImage = "urlImage \(newChampionatName)"
                FirebaseService.sharedInstance.postChampionat(countryName: self.countryName, championat: championat) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }

}

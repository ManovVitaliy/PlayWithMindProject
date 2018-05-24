//
//  CreateNewCountryViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class CreateNewCountryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifier = "NewCountryTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NewCountryTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewCountryTableViewCell
        
        return cell
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
}

//
//  ChooseTeamViewController.swift
//  PlayWithMind
//
//  Created by user on 8/22/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class ChooseTeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - outlets
    @IBOutlet weak var teamsTableView: UITableView!
    
    //MARK: - properties
    var championatName = ""
    
    //MARK: - constants
    private let cellIdentifier = "ChooseChampionatTableViewCell"

    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPreviousSetting()
    }
    
    private func setupTableView() {
        self.teamsTableView.delegate = self
        self.teamsTableView.dataSource = self
        self.teamsTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupPreviousSetting() {
        self.title = championatName
    }
    
    //MARK: - table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: -
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.teamsTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseChampionatTableViewCell
        
        return cell
    }
}

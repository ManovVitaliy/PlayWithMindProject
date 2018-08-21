//
//  ChooseTeamViewController.swift
//  PlayWithMind
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(header: CollapsibleTableViewHeader, section: Int)
}

class ChooseTeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - outlets
    @IBOutlet weak var chooseTeamTableView: UITableView!
    
    // constants
    private let cellIdentifier = "ChooseTeamTableViewCell"
    private let headerIdentifier = "CollapsibleTableViewHeader"
    
    //MARK: - properties
    var sectionsArray = [Section]()
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getData()
    }
    
    private func setupTableView() {
        self.chooseTeamTableView.delegate = self
        self.chooseTeamTableView.dataSource = self
        self.chooseTeamTableView.register(UINib(nibName: "ChooseTeamTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.chooseTeamTableView.register(UINib(nibName: "CollapsibleTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: headerIdentifier)
        
        // Auto resizing the height of the cell
        self.chooseTeamTableView.estimatedRowHeight = 44.0
        self.chooseTeamTableView.rowHeight = UITableViewAutomaticDimension
        self.chooseTeamTableView.estimatedSectionHeaderHeight = 44.0
        self.chooseTeamTableView.estimatedSectionHeaderHeight = UITableViewAutomaticDimension
    }
    
    //get chempionats with teams
    private func getData() {
        FirebaseNetworkManager.sharedInstance.getSections { [weak self] (sectionsArray) in
            if let sectArray = sectionsArray {
                self?.sectionsArray = sectArray
                self?.chooseTeamTableView.reloadData()
            }
        }
    }
    
    //MARK: - table view data source methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.chooseTeamTableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! CollapsibleTableViewHeader
        header.titleLabel.text = sectionsArray[section].name
        header.setCollapsed(collapsed: sectionsArray[section].collapsed)
        header.section = section
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArray[section].collapsed ? 0 : sectionsArray[section].items.count
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return sectionsArray[(indexPath as NSIndexPath).section].collapsed ? 0 : UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseTeamTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseTeamTableViewCell
        cell.teamName.text = sectionsArray[indexPath.section].items[indexPath.row]
        
        return cell
    }
}

extension ChooseTeamViewController: CollapsibleTableViewHeaderDelegate {
    func toggleSection(header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sectionsArray[section].collapsed
        
        // Toggle collapse
        sectionsArray[section].collapsed = collapsed
        header.setCollapsed(collapsed: collapsed)
        
        // Reload the whole section
        self.chooseTeamTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
}

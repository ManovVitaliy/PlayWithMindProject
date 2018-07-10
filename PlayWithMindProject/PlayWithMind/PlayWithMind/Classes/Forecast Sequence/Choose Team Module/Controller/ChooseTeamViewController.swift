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
    
    @IBOutlet weak var chooseTeamTableView: UITableView!
    
    // constants
    private let cellIdentifier = "ChooseTeamTableViewCell"
    private let headerIdentifier = "CollapsibleTableViewHeader"
    
    var sections = [
        Section(name: "Premier Legue", items: ["Arsenal", "Man United", "Chelsea", "Man City", "Tottenham", "Barnley", "Stok City", "WBA", "Newcastle", "Swansea", "Liverpool", "Everton", "West Ham", "Watford"]),
        Section(name: "Bundesliga", items: ["Bayern Munchen", "Shalke 04", "Borrusia D", "Borusia M", "Wolfsburg", "RB Leipzeg", "Hoffencheim"]),
        Section(name: "Primera", items: ["Barcelona", "Real Madrid", "Sevilla", "Viliareal", "Atletico", "Real Sosiedad", "Espaniol", "Atletic Bilbao", "Las-Palmas"], collapsed: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.chooseTeamTableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! CollapsibleTableViewHeader
        header.titleLabel.text = sections[section].name
        header.setCollapsed(collapsed: sections[section].collapsed)
        header.section = section
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return sections[(indexPath as NSIndexPath).section].collapsed ? 0 : UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseTeamTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseTeamTableViewCell
        cell.teamName.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }
}

extension ChooseTeamViewController: CollapsibleTableViewHeaderDelegate {
    func toggleSection(header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed: collapsed)
        
        // Reload the whole section
        self.chooseTeamTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
}

struct Section {
    var name: String
    var items: [String]
    var collapsed: Bool
    
    init(name: String, items: [String], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

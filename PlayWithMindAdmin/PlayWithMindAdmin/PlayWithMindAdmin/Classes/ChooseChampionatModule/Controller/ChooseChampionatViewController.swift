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
    private let cellIdentifier = "ChooseChampionatTableViewCell"
    
    var champsArray = [Championat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
        FirebaseService.sharedInstance.getChampionats { [weak self] (championatArray) in
            if let championatArray = championatArray {
                self?.champsArray = championatArray
                self?.chooseChampionatTableView.reloadData()
            }
        }
//        self.title = "ChooseChampionatViewController"
        self.btn1Hidden(hidden: false)
    }
    
    private func setupTableView() {
        self.chooseChampionatTableView.dataSource = self
        self.chooseChampionatTableView.delegate = self
        self.chooseChampionatTableView.register(UINib(nibName: "ChooseChampionatTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.champsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseChampionatTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChooseChampionatTableViewCell
        cell.championatNameLabel.text = self.champsArray[indexPath.row].championatName
        return cell
    }
    
//    override func btn1Tappaed() {
//        print("btn1 choose Tapped")
//    }
//
//    override func btn2Tappaed() {
//        print("btn2 choose Tapped")
//    }
}


//
//  CreateNewCountryViewController.swift
//  PlayWithMindAdmin
//
//  Created by user on 5/24/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

protocol UpdateDictionary {
    func updateDict(key: String, value: String)
}

class AbstractNewItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: - properties
    var itemDictionary = [String: AnyObject]()
    let cellIdentifier = "AbstractNewItemTableViewCell"
    
    //MARK: - view controller's lifecycl
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "AbstractNewItemTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - tableView data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AbstractNewItemTableViewCell
        
        cell.delegate = self
        let keysArray = Array(itemDictionary.keys)
        let key = keysArray[indexPath.row]
        if let value = itemDictionary[key] as? String {
            cell.fillCell(key: key, value: value)
        } else if let intValue = itemDictionary[key] as? Int {
            let stringValue = String(intValue)
            cell.fillCell(key: key, value: stringValue)
        }
        return cell
    }
    
    //MARK: - actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: - helpers
    
    func allFieldsHaveToBeFullAlert() {
        let alert = UIAlertController(title: "Didn't write info", message: "all textFilds have to be fullen", preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "Ok", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension AbstractNewItemViewController: UpdateDictionary {
    //Every class, who inheritances from AbstractNewItemViewController has himself datasource(itemDictionary).
    //They delegate it to AbstractNewItemViewController. There datasource is updating
    func updateDict(key: String, value: String) {
        self.itemDictionary[key] = value as AnyObject
    }
}






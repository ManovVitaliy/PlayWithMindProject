//
//  TeamParametersViewController.swift
//  PlayWithMind
//
//  Created by user on 8/22/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class TeamParametersViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - outlets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var coachImageView: UIImageView!
    @IBOutlet weak var teamParametersCollectionView: UICollectionView!
    
    //MARK: - constants
    private let parameterCollectionViewCellIdentifier = "ParameterCollectionViewCell"
    private let cellIdentifier = "ParameterCell"
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.teamParametersCollectionView.delegate = self
        self.teamParametersCollectionView.dataSource = self
        self.teamParametersCollectionView.register(UINib.init(nibName: parameterCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - collectionView flow layout delegate's methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (self.view.frame.size.width / 2), height: self.view.frame.size.width / 6)
        return size
    }
    
    //MARK: - collectionView data source methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.teamParametersCollectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        
        return cell
    }
}

//
//  ForecastViewController.swift
//  PlayWithMind
//
//  Created by user on 8/27/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - properties
    
    //MARK: - outlets
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    //MARK: - constants
    private let cellIdentifier = "ForecastCollectionViewCellIdentifier"
    private let collectionViewCellNibName = "ForecastCollectionViewCell"
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        forecastCollectionView.dataSource = self
        forecastCollectionView.delegate = self
        forecastCollectionView.register(UINib.init(nibName: collectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - collection view flow layout delegate's method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.size.width, height: 50)
        
        return size
    }
    
    //MARK: - collectionView's data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = forecastCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }

}

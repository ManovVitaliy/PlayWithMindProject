//
//  ForecatsListViewController.swift
//  PlayWithMind
//
//  Created by user on 8/27/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class ForecatsListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - properties
    
    //MARK: - outlets
    @IBOutlet weak var forecastListCollectionView: UICollectionView!
    
    //MARK: - constants
    private let cellIdentifier = "ForecastInListCellIdentifier"
    private let forecastInListCollectionViewCell = "ForecastInListCollectionViewCell"
    
    //vc
    private let forecastVCIdentifier = "ForecastViewController"
    
    //storyboard
    private let mainStoryboardName = "Main"
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        forecastListCollectionView.dataSource = self
        forecastListCollectionView.delegate = self
        forecastListCollectionView.register(UINib.init(nibName: forecastInListCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - collection view flow layout delegate's method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.size.width, height: 50)
        
        return size
    }
    
    //MARK: - collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = forecastListCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }
    
    //MARK: - collection view delegate's method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushForecastVC()
    }
    
    private func pushForecastVC() {
        let storyboard = UIStoryboard.init(name: mainStoryboardName, bundle: nil)
        let forecastVC = storyboard.instantiateViewController(withIdentifier: forecastVCIdentifier)
        
        self.navigationController?.pushViewController(forecastVC, animated: true)
    }
}

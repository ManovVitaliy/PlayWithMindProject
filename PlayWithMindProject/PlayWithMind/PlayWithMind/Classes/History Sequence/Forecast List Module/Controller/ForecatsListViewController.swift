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
    private let constants = ForecastListConstants()
    
    //MARK: - outlets
    @IBOutlet weak var forecastListCollectionView: UICollectionView!
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        forecastListCollectionView.dataSource = self
        forecastListCollectionView.delegate = self
        forecastListCollectionView.register(UINib.init(nibName: constants.forecastInListCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: constants.cellIdentifier)
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
        let cell = forecastListCollectionView.dequeueReusableCell(withReuseIdentifier: constants.cellIdentifier, for: indexPath)
        
        return cell
    }
    
    //MARK: - collection view delegate's method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushForecastVC()
    }
    
    private func pushForecastVC() {
        let storyboard = UIStoryboard.init(name: constants.mainStoryboardName, bundle: nil)
        let forecastVC = storyboard.instantiateViewController(withIdentifier: constants.forecastVCIdentifier)
        
        self.navigationController?.pushViewController(forecastVC, animated: true)
    }
}

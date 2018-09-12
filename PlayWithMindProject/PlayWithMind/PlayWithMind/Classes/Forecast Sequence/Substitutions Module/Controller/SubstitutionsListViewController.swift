//
//  SubstitutionsListViewController.swift
//  PlayWithMind
//
//  Created by user on 8/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class SubstitutionsListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - outlets
    @IBOutlet weak var substitutionsCollectionView: UICollectionView!
    
    //MARK: - properties
    let constants = SubstitutionsConstants()
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        substitutionsCollectionView.dataSource = self
        substitutionsCollectionView.delegate = self
        substitutionsCollectionView.register(UINib.init(nibName: constants.parameterCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: constants.cellIdentifier)
    }
    
    //MARK: - collectionView flow layout delegate's methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.size.width, height: 50)
        
        return size
    }
    
    //MARK: - collection view data source's methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = substitutionsCollectionView.dequeueReusableCell(withReuseIdentifier: constants.cellIdentifier, for: indexPath)
        cell.backgroundView?.backgroundColor = UIColor.red
        
        return cell
    }
    
    //MARK: - collection view delegate's methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: constants.mainStoryboardName, bundle: nil)
        let playerParameteresVC = storyboard.instantiateViewController(withIdentifier: constants.playerParametersVCIdentifier)
        
        self.navigationController?.pushViewController(playerParameteresVC, animated: true)
    }
}

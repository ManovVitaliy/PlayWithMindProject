//
//  PlayerParametersViewController.swift
//  PlayWithMind
//
//  Created by user on 8/22/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class PlayerParametersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    //MARK: - outlets
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerParametersCollectionView: UICollectionView!
    
    //MARK: - properties
    let player = Player()
    private let constants = PlayerParametersConstants()
    
    //MARK: - view controller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.playerParametersCollectionView.delegate = self
        self.playerParametersCollectionView.dataSource = self
        self.playerParametersCollectionView.register(UINib.init(nibName: constants.parameterCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: constants.cellIdentifier)
    }
    
    //MARK: - collectionView flow layout delegate's methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (self.view.frame.size.width / 2), height: self.view.frame.size.width / 6)
        return size
    }

    //MARK: - collection view datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.playerParametersCollectionView.dequeueReusableCell(withReuseIdentifier: constants.cellIdentifier, for: indexPath)
        
        return cell
    }
    
    //MARK: - actions
    @IBAction func goToFieldPlayerTapped(_ sender: UIButton) {
    }
    
}

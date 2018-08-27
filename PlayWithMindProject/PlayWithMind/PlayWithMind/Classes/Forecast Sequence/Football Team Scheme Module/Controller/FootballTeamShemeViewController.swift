//
//  FootballTeamShemeViewController.swift
//  PlayWithMind
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FootballTeamSchemeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - outlets
    @IBOutlet weak var homeTeamCollectionView: UICollectionView!
    @IBOutlet weak var awayTeamCollectionView: UICollectionView!
    @IBOutlet weak var homeTeamSchemeNameLabel: UILabel!
    @IBOutlet weak var awayTeamSchemeNameLabel: UILabel!
    
    //MARK: - properties
    private var homeTeamCurrentScheme: Scheme!
    private var homeTeamCurrentIndex: Int = 0
    private var awayTeamCurrentScheme: Scheme!
    private var awayTeamCurrentIndex: Int = 0
    var footballTeamSchemeModel: FootbalTeamSchemeModel!
    private var homeTeamSchemesArray: [Scheme] = [Scheme]()
    private var awayTeamSchemesArray: [Scheme] = [Scheme]()
    
    //MARK: - constants
    private let cellIdentifier = "FootballPlayerCell"
    private let navigationBarTitle = "Main Screen"
    private let sizeKoeff: CGFloat = 0.98
    
    // view controllers's identifiers
    private let chooseChampionatVCIdentifier = "ChooseChampionatViewController"
    private let teamParametersVCIdentifier = "TeamParametersViewController"
    private let playerParametersVCIdentifier = "PlayerParametersViewController"
    private let substitutionListVCIdentifier = "SubstitutionsListViewController"
    private let forecastVCIdentifier = "ForecastViewController"
    
    // cell identifire
    private let playerCollectionViewCellIdentifier = "FootballPlayerCollectionViewCell"
    
    //storyboard
    private let mainStoryboardName = "Main"
    
    //MARK: - view controller's lifecycle
    override func loadView() {
        super.loadView()
        //model initialization
        footballTeamSchemeModel = FootbalTeamSchemeModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupCollectionView()
        self.setupSchemesArray()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.blue
        self.navigationItem.title = navigationBarTitle
    }
    
    private func setupCollectionView() {
        self.homeTeamCollectionView.delegate = self
        self.homeTeamCollectionView.dataSource = self
        self.homeTeamCollectionView.register(UINib(nibName: playerCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: self.cellIdentifier)
        
        self.awayTeamCollectionView.delegate = self
        self.awayTeamCollectionView.dataSource = self
        self.awayTeamCollectionView.register(UINib(nibName: playerCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: self.cellIdentifier)
    }
    
    // data source
    private func setupSchemesArray() {
        self.homeTeamSchemesArray = footballTeamSchemeModel.teamSchemesArray
        self.homeTeamCurrentScheme = self.homeTeamSchemesArray[homeTeamCurrentIndex]
        self.homeTeamSchemeNameLabel.text = self.homeTeamCurrentScheme.schemeName
        
        self.awayTeamSchemesArray = footballTeamSchemeModel.teamSchemesArray
        self.awayTeamCurrentScheme = self.awayTeamSchemesArray[awayTeamCurrentIndex]
        self.awayTeamSchemeNameLabel.text = self.awayTeamCurrentScheme.schemeName
    }
    
    //MARK: - collectionViewFlowLoyoutDelegate's method's
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == self.homeTeamCollectionView) {
            let numberOfLines: Int = self.homeTeamCurrentScheme.fifthLine != nil ? 5 : 4
            let height: CGFloat = self.homeTeamCollectionView.frame.height / (CGFloat(numberOfLines))
            let size: CGSize = CGSize(width: sizeKoeff * height * 5 / 6, height: sizeKoeff * height)
            
            return size
        } else {
            let numberOfLines: Int = self.awayTeamCurrentScheme.fifthLine != nil ? 5 : 4
            let height: CGFloat = self.awayTeamCollectionView.frame.height / (CGFloat(numberOfLines))
            let size: CGSize = CGSize(width: sizeKoeff * height * 5 / 6, height: sizeKoeff * height)
            
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var currentScheme: Scheme = self.homeTeamCurrentScheme
        if (collectionView == self.awayTeamCollectionView) {
            currentScheme = self.awayTeamCurrentScheme
        }
        
        let numberOfLines: Int = currentScheme.fifthLine != nil ? 5 : 4
        let width: CGFloat = self.homeTeamCollectionView.frame.height * 5 / (CGFloat(numberOfLines) * 6)
        
        let cellWidth = width
        var cellCount: Int = 1
        let cellSpacing = 10.0
        
        if (collectionView == self.homeTeamCollectionView) {
            switch section {
            case 0:
                if let firstL = currentScheme.firstLine {
                    cellCount = firstL
                }
            case 1:
                if let secondL = currentScheme.secondLine {
                    cellCount = secondL
                }
            case 2:
                if let thirdL = currentScheme.thirdLine {
                    cellCount = thirdL
                }
            case 3:
                if let fourthL = currentScheme.fourthLine {
                    cellCount = fourthL
                }
            case 4:
                if let fifthL = currentScheme.fifthLine {
                    cellCount = fifthL
                }
            default:
                cellCount = 1
            }
        } else {
            switch section {
            case 0:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.fifthLine! : currentScheme.fourthLine!
            case 1:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.fourthLine! : currentScheme.thirdLine!
            case 2:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.thirdLine! : currentScheme.secondLine!
            case 3:
                cellCount = currentScheme.fifthLine != nil ? currentScheme.secondLine! : currentScheme.firstLine!
            case 4:
                if (currentScheme.fifthLine != nil) {
                    cellCount = currentScheme.firstLine!
                }
            default:
                cellCount = 1
            }
        }
        
        let totalCellWidth = Double(cellWidth) * Double(cellCount)
        let totalSpacingWidth = cellSpacing * (Double(cellCount) - 1)
        
        let leftInset = (self.homeTeamCollectionView!.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsetsMake(0, leftInset * sizeKoeff, 0, rightInset * sizeKoeff)
    }
    
    //MARK: - collectionView data source methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == self.homeTeamCurrentScheme) {
            if (self.homeTeamCurrentScheme.fifthLine != nil) {
                return 5
            } else {
                return 4
            }
        } else {
            if (self.awayTeamCurrentScheme.fifthLine != nil) {
                return 5
            } else {
                return 4
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var returnItemsValue: Int = 0
        
        var currentScheme: Scheme = self.homeTeamCurrentScheme
        if (collectionView == self.awayTeamCollectionView) {
            currentScheme = self.awayTeamCurrentScheme
        }
        
        if (collectionView == self.homeTeamCollectionView) {
            switch section {
            case 0:
                if let firstL = currentScheme.firstLine {
                    returnItemsValue = firstL
                }
            case 1:
                if let secondL = currentScheme.secondLine {
                    returnItemsValue = secondL
                }
            case 2:
                if let thirdL = currentScheme.thirdLine {
                    returnItemsValue = thirdL
                }
            case 3:
                if let fourthL = currentScheme.fourthLine {
                    returnItemsValue = fourthL
                }
            case 4:
                if let fifthL = currentScheme.fifthLine {
                    returnItemsValue = fifthL
                }
            default:
                returnItemsValue = 0
            }
        } else {
            switch section {
            case 0:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.fifthLine! : currentScheme.fourthLine!
            case 1:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.fourthLine! : currentScheme.thirdLine!
            case 2:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.thirdLine! : currentScheme.secondLine!
            case 3:
                returnItemsValue = currentScheme.fifthLine != nil ? currentScheme.secondLine! : currentScheme.firstLine!
            case 4:
                if (currentScheme.fifthLine != nil) {
                    returnItemsValue = currentScheme.firstLine!
                }
            default:
                returnItemsValue = 1
            }
        }
        
        return returnItemsValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.homeTeamCollectionView) {
            let cell = self.homeTeamCollectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
            
            return cell
        } else {
            let cell = self.awayTeamCollectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
            
            return cell
        }
    }
    
    //MARK: - collectionView delegate's methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == self.homeTeamCollectionView) {
            //TODO: - need update when database is been
            showPlayerParameters()
        } else {
            //TODO: - need update when database is been
            showPlayerParameters()
        }
    }
    
    //MARK: - actions
    
    // change team's scheme buttons
    @IBAction func backButtonHomeTeamTapped(_ sender: Any) {
        homeTeamPreviousScheme()
    }
    
    @IBAction func nextButtonHomeTeamTapped(_ sender: Any) {
        homeTeamNextScheme()
    }
    
    @IBAction func backButtonAwayTeamTapped(_ sender: Any) {
        awayTeamPreviousScheme()
    }
    
    @IBAction func nextButtonAwayTeamTapped(_ sender: Any) {
        awayTeamNextScheme()
    }
    
    // choose new team buttons
    @IBAction func homeTeamChangeTapped(_ sender: Any) {
        pushChooseChampionatVC()
    }
    
    @IBAction func awayTeamChangeTapped(_ sender: Any) {
        pushChooseChampionatVC()
    }
    
    // change team's parameters buttons
    @IBAction func homeTeamSettingsTapped(_ sender: UIButton) {
        showTeamSettings()
    }
    
    @IBAction func awayTeamSettingsTapped(_ sender: UIButton) {
        showTeamSettings()
    }
    
    // choose new player(substitutions list)
    @IBAction func homeTeamSubstitutionsTapped(_ sender: UIButton) {
        pushSubstitutionListVC()
    }
    
    @IBAction func awayTeamSubstitutionsTapped(_ sender: UIButton) {
        pushSubstitutionListVC()
    }
    
    // push to forecast
    @IBAction func getResultButtonTapped(_ sender: UIButton) {
        pushForecastVC()
    }
    
    //change home team scheme
    private func homeTeamPreviousScheme() {
        if (self.homeTeamCurrentIndex == 0) {
            self.homeTeamCurrentIndex = self.homeTeamSchemesArray.count - 1
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        } else {
            self.homeTeamCurrentIndex -= 1
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        }
        self.homeTeamSchemeNameLabel.text = self.homeTeamCurrentScheme.schemeName
        self.homeTeamCollectionView.reloadData()
    }
    
    private func homeTeamNextScheme() {
        if (self.homeTeamCurrentIndex == self.homeTeamSchemesArray.count - 1) {
            self.homeTeamCurrentIndex = 0
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        } else {
            self.homeTeamCurrentIndex += 1
            self.homeTeamCurrentScheme = self.homeTeamSchemesArray[self.homeTeamCurrentIndex]
        }
        self.homeTeamSchemeNameLabel.text = self.homeTeamCurrentScheme.schemeName
        self.homeTeamCollectionView.reloadData()
    }
    
    //change away team scheme
    private func awayTeamPreviousScheme() {
        if (self.awayTeamCurrentIndex == 0) {
            self.awayTeamCurrentIndex = self.awayTeamSchemesArray.count - 1
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        } else {
            self.awayTeamCurrentIndex -= 1
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        }
        self.awayTeamSchemeNameLabel.text = self.awayTeamCurrentScheme.schemeName
        self.awayTeamCollectionView.reloadData()
    }
    
    private func awayTeamNextScheme() {
        if (self.awayTeamCurrentIndex == self.awayTeamSchemesArray.count - 1) {
            self.awayTeamCurrentIndex = 0
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        } else {
            self.awayTeamCurrentIndex += 1
            self.awayTeamCurrentScheme = self.awayTeamSchemesArray[self.awayTeamCurrentIndex]
        }
        self.awayTeamSchemeNameLabel.text = self.awayTeamCurrentScheme.schemeName
        self.awayTeamCollectionView.reloadData()
    }
    
    //show team parameters
    private func showTeamSettings() {
        let storyboard = UIStoryboard.init(name: mainStoryboardName, bundle: nil)
        let teamParametersVC = storyboard.instantiateViewController(withIdentifier: teamParametersVCIdentifier)
        
        self.navigationController?.pushViewController(teamParametersVC, animated: true)
    }
    
    //show player parameters
    private func showPlayerParameters() {
        let storyboard = UIStoryboard.init(name: mainStoryboardName, bundle: nil)
        let playerParametersVC = storyboard.instantiateViewController(withIdentifier: playerParametersVCIdentifier)
        
        self.navigationController?.pushViewController(playerParametersVC, animated: true)
    }
    
    //show another championats and teams
    private func pushChooseChampionatVC() {
        let storyboard = UIStoryboard.init(name: mainStoryboardName, bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: chooseChampionatVCIdentifier)
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    //push to substitutions list vc
    private func pushSubstitutionListVC() {
        let storyboard = UIStoryboard.init(name: mainStoryboardName, bundle: nil)
        let substitutionsListVC = storyboard.instantiateViewController(withIdentifier: substitutionListVCIdentifier)
        
        self.navigationController?.pushViewController(substitutionsListVC, animated: true)
    }
    
    private func pushForecastVC() {
        let storyboard = UIStoryboard.init(name: mainStoryboardName, bundle: nil)
        let forecastVC = storyboard.instantiateViewController(withIdentifier: forecastVCIdentifier)
        
        self.navigationController?.pushViewController(forecastVC, animated: true)
    }
    
}

//
//  FirstCampaignViewController.swift
//  NewTransitionPrototypeBase
//
//  Created by Luisa Cruz on 22.11.17.
//  Copyright © 2017 Luisa Cruz. All rights reserved.
//

import UIKit
import Hero

private let reuseIdentifier = "product"

class CampaignViewController: UICollectionViewController {
    
    
    var campaign: Campaign!
    
    let products = [["image": #imageLiteral(resourceName: "product1"), "name": "First Product"],
                    ["image": #imageLiteral(resourceName: "product2"), "name": "Second Product"],
                    ["image": #imageLiteral(resourceName: "product3"), "name": "Third Product"],
                    ["image": #imageLiteral(resourceName: "product4"), "name": "Forth Product"]]
    
    var selectedProduct: [String: Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isHeroEnabled = true
        navigationController?.heroNavigationAnimationType = .fade
        
        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = products[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductViewCell
        cell.product = product
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! CampaignHeaderView
        header.campaign = campaign
        
        return header
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ProductViewController
        destination.product = selectedProduct
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedProduct = products[indexPath.row]
        performSegue(withIdentifier: "ShowProductSegue", sender: self)
    }

}


extension CampaignViewController: HeroViewControllerDelegate {
    
    func heroWillStartAnimatingTo(viewController: UIViewController) {
        collectionView?.heroModifiers = [.cascade(delta:0.015)]
    }
    
    func heroWillStartAnimatingFrom(viewController: UIViewController) {
        collectionView?.heroModifiers = [.cascade(delta:0.015)]
    }
}

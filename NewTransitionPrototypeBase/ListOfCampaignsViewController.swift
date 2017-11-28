//
//  ListOfCampaignsViewController.swift
//  NewTransitionPrototypeBase
//
//  Created by Luisa Cruz on 22.11.17.
//  Copyright © 2017 Luisa Cruz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Campaign {
    let name: String
    let image: UIImage
    let brandName: String
    let id: String
}

class ListOfCampaignsViewController: UICollectionViewController {

    let campaigns = [Campaign(name: "This is a nice Campaign", image: #imageLiteral(resourceName: "campagin1-A"), brandName: "Super Towels", id: "000"),
                     Campaign(name: "This is other nice Campaign", image: #imageLiteral(resourceName: "campagin2-A"), brandName: "Things to Eat", id: "001"),
                     Campaign(name: "This Campaign is ok only", image: #imageLiteral(resourceName: "campagin3-A"), brandName: "Super Truper Towels", id: "002")]
    var selectedCampaign: Campaign!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isHeroEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! CampaignViewController
        destination.campaign = selectedCampaign
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CampaignViewCell
        cell.campaign = campaigns[indexPath.row]    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCampaign = campaigns[indexPath.row]
        performSegue(withIdentifier: "ShowCampaignSegue", sender: self)
    }

}

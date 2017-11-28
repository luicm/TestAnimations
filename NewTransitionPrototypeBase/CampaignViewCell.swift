//
//  CampaignViewCell.swift
//  NewTransitionPrototypeBase
//
//  Created by Luisa Cruz on 22.11.17.
//  Copyright © 2017 Luisa Cruz. All rights reserved.
//

import UIKit
import Hero

class CampaignViewCell: UICollectionViewCell {
    var campaign: Campaign! {
        didSet {
            moodImage.image = campaign.image
            moodImage.heroID = "image_\(campaign.id)"
            brandNameLabel.text = campaign.brandName
            brandNameLabel.heroID = "brand_name_\(campaign.id)"
            campaignNameLabel.text = campaign.name
            campaignNameLabel.heroID =  "name_\(campaign.id)"
            startDateLabel.heroID =  "start_date_\(campaign.id)"
        }
    }
    
    @IBOutlet weak var moodImage: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var campaignNameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    
}

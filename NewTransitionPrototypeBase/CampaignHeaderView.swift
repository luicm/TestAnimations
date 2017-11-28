//
//  CampaignHeaderView.swift
//  NewTransitionPrototypeBase
//
//  Created by Luisa Cruz on 23.11.17.
//  Copyright © 2017 Luisa Cruz. All rights reserved.
//

import UIKit

class CampaignHeaderView: UICollectionReusableView {
    
    
    var campaign: Campaign! {
        didSet {
            moodImage.image = campaign.image
            moodImage.heroID = "image_\(campaign.id)"
//            moodImage.heroModifiers = [.spring(stiffness: 25, damping: 4), .timingFunction(.easeInOut)]
            brandNameLabel.text = campaign.brandName
            brandNameLabel.heroID = "brand_name_\(campaign.id)"
            brandNameLabel.heroModifiers = [.delay(0.04)]
            campaignNameLabel.text = campaign.name
            campaignNameLabel.heroID =  "name_\(campaign.id)"
            campaignNameLabel.heroModifiers = [.delay(0.07)]
            startDateLabel.heroID =  "start_date_\(campaign.id)"
            startDateLabel.heroModifiers = [.delay(0.1)]
        }
    }
    
    @IBOutlet weak var moodImage: UIImageView! 
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var campaignNameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    
    
}

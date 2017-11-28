//
//  ProductViewCell.swift
//  NewTransitionPrototypeBase
//
//  Created by Luisa Cruz on 22.11.17.
//  Copyright © 2017 Luisa Cruz. All rights reserved.
//

import UIKit
import Hero


class ProductViewCell: UICollectionViewCell {
    
    var product: [String: Any]! {
        didSet {
            let name = product["name"] as! String
            productImage.heroID = "image_\(name)"
            productImage.heroModifiers = [.fade, .scale(0.8)]
            productImage.image = product["image"] as? UIImage
            productNameLabel.heroID = "name_\(name)"
            productNameLabel.text = name
        }
    }
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
}

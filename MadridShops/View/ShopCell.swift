//
//  ShopCell.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 8/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {

    var shop : Shop?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func refresh(shop: Shop){
        self.shop = shop
        
        self.label.text = shop.name
    }
}

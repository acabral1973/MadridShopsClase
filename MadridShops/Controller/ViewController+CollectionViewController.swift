//
//  ViewController+CollectionViewController.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 7/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.shops?.count())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ShopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCell
        
        let shop : Shop = (self.shops?.get(index: indexPath.row))!
        
        cell.refresh(shop: shop)
        
        return cell
    }
    
    
}

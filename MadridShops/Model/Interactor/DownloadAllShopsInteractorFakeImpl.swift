//
//  DownloadAllShopsInteractorFakeImpl.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 7/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorFakeImpl: DownloadAllShopsInteractorProtocol {
    
    func execute(onSuccess: @escaping successClosure) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        var shops = Shops()
        
        for i in 0...10 {
            let shop = Shop(name: "Shop number \(i)")
            shop.address = "Adress \(i)"
            
            shops.add(shop: shop)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
    
    
}

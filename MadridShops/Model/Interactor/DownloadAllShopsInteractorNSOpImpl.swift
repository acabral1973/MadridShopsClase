//
//  DownloadAllShopsInteractorNSOpImpl.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 11/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSOpImpl: DownloadAllShopsInteractorProtocol {
    
    func execute(onSuccess: @escaping successClosure) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        
        let queque = OperationQueue()
        queque.addOperation {
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data? {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as!     Dictionary<String, Any>
                    let result = jsonObject["result"] as! [Dictionary<String,Any>]
                    let shops = Shops()
                
                    for shopJson in result {
                        let shop = Shop(name: shopJson["name"] as! String)
                        shop.address = shopJson["address"]! as! String
                        shops.add(shop: shop)
                    }
                
                    OperationQueue.main.addOperation {
                        onSuccess(shops)
                    }
                } catch {
                    // código si falla la carga del json desde internet
                }
            }
        }
    }
}


//
//  Shops.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 7/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

public protocol ShopsProtocol {
    func count() -> Int
    func add( shop: Shop)
    func get(index: Int) -> Shop
}


public class Shops: ShopsProtocol {
    
    private var _shopList: [Shop]?
    
    public init() {
        self._shopList = []
    }
    
    public func count() -> Int {
        return (_shopList?.count)!
    }
    
    public func add(shop: Shop) {
        _shopList?.append(shop)
    }
    
    public func get(index: Int) -> Shop {
        return (_shopList?[index])!
    }
    
}

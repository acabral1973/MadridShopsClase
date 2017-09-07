//
//  ShopsTests.swift
//  MadridShopsTests
//
//  Created by Alejandro Cabral Benavente on 7/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import XCTest
import MadridShops

class ShopsTests: XCTestCase {
    
    func testGivenEmptyShopsNumberShopsIsZero() {
        let sut = Shops()
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenShopsWithOneEkementNumberShopsIsOne(){
        let sut = Shops()
        sut.add(shop: Shop(name: "La Tiendita"))
        XCTAssertEqual(1, sut.count())
    }
}

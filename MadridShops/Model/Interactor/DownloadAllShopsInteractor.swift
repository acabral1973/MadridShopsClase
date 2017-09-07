//
//  DownloadAllShopsInteractor.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 7/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

typealias errorClosure = ((Error) -> Void)?
typealias successClosure = (Shops) -> Void

protocol DownloadAllShopsInteractorProtocol {
    // execute: downloads all shops and return result (shop list or error)
    func execute(onSuccess: @escaping successClosure , onError: errorClosure)
    func execute(onSuccess: @escaping successClosure)
}



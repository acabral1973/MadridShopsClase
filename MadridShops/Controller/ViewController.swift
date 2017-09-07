//
//  ViewController.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 7/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shops : Shops?
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let downloadShopsInteractor: DownloadAllShopsInteractorProtocol = DownloadAllShopsInteractorFakeImpl()
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            // Código para cuando va bien el proceso
            self.shops = shops
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
            
        }) { (error: Error) in
            // Código para cuando falla el proceso
        }
    }
}


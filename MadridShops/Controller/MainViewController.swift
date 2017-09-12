//
//  MainViewController.swift
//  MadridShops
//
//  Created by Alejandro Cabral Benavente on 11/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit
import FillableLoaders

class MainViewController: UIViewController {
    
    var myLoader: WavesLoader?
    var v: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dibujo la estrella
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 180, y: 25))
        starPath.addLine(to: CGPoint(x: 195.16, y: 43.53))
        starPath.addLine(to: CGPoint(x: 220.9, y: 49.88))
        starPath.addLine(to: CGPoint(x: 204.54, y: 67.67))
        starPath.addLine(to: CGPoint(x: 205.27, y: 90.12))
        starPath.addLine(to: CGPoint(x: 180, y: 82.6))
        starPath.addLine(to: CGPoint(x: 154.73, y: 90.12))
        starPath.addLine(to: CGPoint(x: 155.46, y: 67.67))
        starPath.addLine(to: CGPoint(x: 139.1, y: 49.88))
        starPath.addLine(to: CGPoint(x: 164.84, y: 43.53))
        starPath.close()
        starPath.fill()
        
        // la agrego como subvista
        let myPath = starPath.cgPath
        self.myLoader = WavesLoader.showLoader(with: myPath)
        self.view.addSubview(self.myLoader!)
        
        // rectangulo azul
        let rect = CGRect(x: 10, y: 100, width: 200, height: 200)
        v = UIView(frame: rect)
        v?.backgroundColor = UIColor.blue
        self.view.addSubview(v!)
        
        // agrego reconocedor de gesto (doble tap)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateView))
        tapGesture.numberOfTouchesRequired = 1 // número de dedos
        tapGesture.numberOfTapsRequired = 2 // veces que los dedos golpean
        self.view.addGestureRecognizer(tapGesture)
        
        // agrego reconocedor de gesto (swipe)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(restoreView))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

    }
    
    // función definida para el gesto doble tap
    // la baja 200 puntos
    @objc func animateView(){
        UIView.animate(withDuration: 2.0) {
            let newFrame = CGRect(x: (self.myLoader?.frame.origin.x)!,
                                  y: (self.myLoader?.frame.origin.y)! + 200,
                                  width: (self.myLoader?.frame.size.width)!,
                                  height: (self.myLoader?.frame.size.height)!)
            self.myLoader?.frame = newFrame
            
            // el cornerradius controla el biselado de los angulos
                self.v?.layer.cornerRadius = (self.v?.layer.cornerRadius)! + 15    // el layer es la representación gráfica
                                                                                    //de mi vista
                self.v?.backgroundColor = UIColor.red
        }
    }
    
    // función definida para el gesto doble tap
    // sube el frame al origen (0,0) arriba a la izquierda
    @objc func restoreView(){
        UIView.animate(withDuration: 2.0, animations: {
            let newFrame = CGRect(x: 0,
                                  y: 0,
                                  width: (self.myLoader?.frame.size.width)!,
                                  height: (self.myLoader?.frame.size.height)!)
            self.myLoader?.frame = newFrame
        }) { (elFary: Bool) in
            UIView.animate(withDuration: 1.0, animations: {
                self.v?.layer.cornerRadius = 0
                self.v?.backgroundColor = UIColor.blue
            })
        }
    }
    
    
}

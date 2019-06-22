//
//  AnimatedProgressBarVC.swift
//  ObjectWithAnimations
//
//  Created by Rahul Chopra on 18/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class AnimatedProgressBarVC: UIViewController {
    
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        shapeLayer.path = UIBezierPath(arcCenter: self.view.center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = kCALineCapRound
        
        shapeLayer.strokeEnd = 0
        
        self.view.layer.addSublayer(shapeLayer)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap() {
    
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = 3
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }

}

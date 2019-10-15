//
//  UIView+Shadow.swift
//  Deco
//
//  Created by General Factory on 2017. 6. 3..
//  Copyright © 2017년 General Factory. All rights reserved.
//

import UIKit

extension UIView {
    
    func dropShadow(bounds: CGRect, cornerRadius: CGFloat) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        
        shadowLayer.shadowColor = kGRAY_500.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.3
        shadowLayer.shadowRadius = 3.0
        shadowLayer.name = "shadow"
        
        self.layer.insertSublayer(shadowLayer, at: 0)
        self.layer.masksToBounds = false
    }
    
    func dropNaviShadow(bounds: CGRect, cornerRadius: CGFloat, bgColor: UIColor) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = bgColor.cgColor
        
        shadowLayer.shadowColor = kGRAY_500.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.1
        shadowLayer.shadowRadius = 5.0
        shadowLayer.name = "shadow"
        
        self.layer.insertSublayer(shadowLayer, at: 0)
        self.layer.masksToBounds = false
    }

    func dropSmallShadow(bounds: CGRect, cornerRadius: CGFloat) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        
        shadowLayer.shadowColor = kGRAY_500.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shadowLayer.shadowOpacity = 0.3
        shadowLayer.shadowRadius = 2.0
        shadowLayer.name = "shadow"
        
        self.layer.insertSublayer(shadowLayer, at: 0)
        self.layer.masksToBounds = false
    }

    func dropDeepShadow() {
        self.layer.shadowColor = kGRAY_500.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 8.0
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        //        self.layer.masksToBounds = false
        //        self.layer.shadowColor = UIColor.black.cgColor
        //        self.layer.shadowOpacity = 0.5
        //        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        //        self.layer.shadowRadius = 4.0
    }
    
    func removeShadow() {
        if (self.layer.sublayers?.count)! > 0 {
            self.layer.sublayers?.forEach {
                if $0.name == "shadow" {
                    $0.removeFromSuperlayer()
                }
            }
        }
    }
    
}


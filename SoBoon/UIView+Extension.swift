//
//  UIView+Extension.swift
//  SoBoon
//
//  Created by CHOMINJI on 08/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

extension UIImageView {
    func roundCorners() {
        let radius = bounds.width / 2
        layer.cornerRadius = radius
    }
}


@IBDesignable class RoundImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners()
    }
}

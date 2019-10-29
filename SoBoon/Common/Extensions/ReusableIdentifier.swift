//
//  ReusableIdentifier.swift
//  SoBoon
//
//  Created by CHOMINJI on 29/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

protocol ReusableObjectType { }
extension ReusableObjectType {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableObjectType { }

extension UICollectionViewCell: ReusableObjectType { }

extension UITableViewHeaderFooterView: ReusableObjectType { }

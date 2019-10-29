//
//  UIFont+Custom.swift
//  SoBoon
//
//  Created by CHOMINJI on 29/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

enum CustomFontName {
    static let notoSansCJKkr = "NotoSansCJKkr"
}

enum NotoSansWeight: String {
    case thin = "-Thin"
    case light = "-Light"
    case demiLight = "-DemiLight"
    case regular = "-Regular"
    case medium = "-Medium"
    case bold = "-Bold"
    case black = "-Black"
}

extension UIFont {
    static func notoSansFont(ofSize size: CGFloat = UIFont.systemFontSize, weight: NotoSansWeight = .regular) -> UIFont {
        return UIFont(name: "\(CustomFontName.notoSansCJKkr)\(weight.rawValue)", size: size)!
    }
    
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
}

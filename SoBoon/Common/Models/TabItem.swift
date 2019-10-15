//
//  TabItem.swift
//  Petcipes
//
//  Created by GENETORY on 05/07/2019.
//  Copyright © 2019 GENETORY. All rights reserved.
//

import UIKit

enum TabType: Int {
    case feed
    case post
    case notification
    case profile
}

struct TabItem {
    var title: String?
    var iconImage: String?
    var type: TabType?
    
    init(title: String?, iconImage: String?, type: TabType?) {
        self.title = title
        self.iconImage = iconImage
        self.type = type
    }
}

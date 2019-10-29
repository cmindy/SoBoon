//
//  FeedTitleHeaderView.swift
//  SoBoon
//
//  Created by CHOMINJI on 17/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedTitleHeaderView: UITableViewHeaderFooterView {

    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initLabel() {
        titleLabel.textColor = kGRAY_800
        titleLabel.font = UIFont.notoSansFont(ofSize: 16.0, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initLabel()
    }
    
}

// MARK: - Extension

extension FeedTitleHeaderView {
    
    func title(_ title: String?) {
        titleLabel.text = title
    }
    
}

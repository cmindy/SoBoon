//
//  FeedDetailTitleCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 29/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedDetailTitleCell: UITableViewCell {

    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - LifeCycle

    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initLabel() {
        titleLabel.font = UIFont.notoSansFont(ofSize: 20.0, weight: .bold)
//        titleLabel.text = "달콤한 갈비만두 나누실 분 구함!"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initLabel()
    }
}

// MARK: -
extension FeedDetailTitleCell {
    func configure(title: FeedDetailTitle) {
        titleLabel.text = title.title
    }
}

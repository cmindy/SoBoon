//
//  MyPagePreferencesCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 02/11/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class MyPagePreferencesCell: UITableViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dividerView: UIImageView!
    

    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initAttributes()
    }
}

// MARK: - Attributes

extension MyPagePreferencesCell {
    private func initAttributes() {
        initVars()
        initBackgroundView()
        initLabels()
    }
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initLabels() {
        titleLabel.font = UIFont.notoSansFont(ofSize: 16.0, weight: .regular)
        
        contentLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .regular)
        contentLabel.textColor = kGRAY_500
    }
}

// MARK: -
extension MyPagePreferencesCell {
    func configure(title: String, content: String?) {
        titleLabel.text = title
        
        if let content = content {
            contentLabel.isHidden = false
            contentLabel.text = content
        } else {
            contentLabel.isHidden = true
            self.accessoryType = .disclosureIndicator
        }
    }
    
    func divider(_ divider: Bool) {
        dividerView.isHidden = !divider
    }
}


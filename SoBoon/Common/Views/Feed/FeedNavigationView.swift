//
//  FeedNavigationView.swift
//  SoBoon
//
//  Created by CHOMINJI on 17/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedNavigationView: BaseCustomView {

    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageview: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kPINK_500
    }
    
    private func initLabels() {
        titleLabel.textColor = kWHITE
        titleLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        titleLabel.text = "우리 동네, "
        
        addressLabel.textColor = kWHITE
        addressLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        addressLabel.text = "서대문구 연세로"
    }
    
    private func initImageView() {
        iconImageview.image = UIImage(named: "icon_marker")?.withRenderingMode(.alwaysTemplate)
        iconImageview.tintColor = kWHITE
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initLabels()
        initImageView()
    }

}

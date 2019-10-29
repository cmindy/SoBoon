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
    
    @IBOutlet weak var baseView: GeneralGradientView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageview: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        
    }
    
    private func initLabels() {
        titleLabel.textColor = kWHITE
        titleLabel.font = UIFont.notoSansFont(ofSize: 24.0, weight: .bold)
        titleLabel.text = "우리 동네, "
        
        addressLabel.textColor = kWHITE
        addressLabel.font = UIFont.notoSansFont(ofSize: 16.0, weight: .bold)
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

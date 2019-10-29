//
//  GeneralNavigationView.swift
//  SoBoon
//
//  Created by CHOMINJI on 16/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class GeneralNavigationView: BaseCustomView {
    
    // MARK: - Vars
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bigTitleLabel: UILabel!
    
    @IBOutlet weak var dividerImageView: UIImageView!
    
    // MARK: - Life Cycle
    
    func initVars() {
        self.clipsToBounds = true
    }
    
    func initBackgroundView() {
        
    }
    
    func initTopView() {
        self.titleLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .bold)
        self.titleLabel.textColor = kGRAY_800
        self.titleLabel.textAlignment = .center
        self.titleLabel.text = nil
        
        self.leftButton.isHidden = true
        self.subButton.isHidden = true
        self.rightButton.isHidden = true
    }
    
    func initBottomView() {
        self.bigTitleLabel.font = UIFont.notoSansFont(ofSize: 24.0, weight: .black)
        self.bigTitleLabel.textColor = kGRAY_800
        self.bigTitleLabel.textAlignment = .left
        self.bigTitleLabel.text = nil
    }
    
    func initDividerView() {
        self.dividerImageView.image = UIImage.init(named: "divider_b")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.initVars()
        self.initBackgroundView()
        self.initTopView()
        self.initBottomView()
        self.initDividerView()
    }
    
    // MARK: -
    
    func divider(_ divider: Bool) {
        self.dividerImageView.isHidden = !divider
    }
    
    func title(_ title: String?) {
        self.titleLabel.text = title
    }
    
    func bigTitle(_ bigTitle: String?) {
        self.bigTitleLabel.text = bigTitle
    }
    
    func bgColor(_ color: UIColor) {
        self.topView.backgroundColor = color
        self.containerView.backgroundColor = color
    }
    
    func naviButtonColor(color: UIColor) {
        self.leftButton.tintColor = color
        self.subButton.tintColor = color
        self.rightButton.tintColor = color
    }
    
    func titleColor(_ color: UIColor) {
        self.titleLabel.textColor = color
        self.bigTitleLabel.textColor = color
    }
    
    func showBigTitle(bigTitle: Bool) {
        if bigTitle {
            self.bigTitleLabel.alpha = 1.0
            self.titleLabel.alpha = 0.0
        }
        else {
            self.bigTitleLabel.alpha = 0.0
            self.titleLabel.alpha = 1.0
        }
    }
    
    func showBackButton() {
        self.leftButton.isHidden = false
        self.leftButton.setImage(UIImage(named: "icoChevron"), for: .normal)
    }
}

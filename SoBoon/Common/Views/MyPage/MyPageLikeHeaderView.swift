//
//  MyPageLikeHeaderView.swift
//  SoBoon
//
//  Created by CHOMINJI on 01/11/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class MyPageLikeHeaderView: UICollectionReusableView {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var likeCountBaseView: UIView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!

    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initAttributes()
    }
}

// MARK: - Attributes

extension MyPageLikeHeaderView {
    private func initAttributes() {
        initVars()
        initBackgroundView()
        initLikeCountBaseView()
        initLikeImageView()
        initLabels()
    }
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initLikeCountBaseView() {
        likeCountBaseView.clipsToBounds = true
        likeCountBaseView.layer.cornerRadius = 15.0
        likeCountBaseView.layer.borderColor = kPINK_500.cgColor
        likeCountBaseView.layer.borderWidth = 1.0
        
        likeCountBaseView.backgroundColor = kWHITE
    }
    
    private func initLikeImageView() {
        likeImageView.image = UIImage(named: "iconHeart")
    }
    
    private func initLabels() {
        noticeLabel.font = UIFont.notoSansFont(ofSize: 13.0, weight: .regular)
        noticeLabel.textColor = kGRAY
        noticeLabel.text = "찜한 소분은 최대 90일간 저장됩니다."
        
        likeCountLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .medium)
        likeCountLabel.textColor = kPINK_500
        likeCountLabel.text = "12"
    }
}

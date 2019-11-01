//
//  MyPageLikeCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 01/11/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class MyPageLikeCell: UICollectionViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var thumbBaseView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var deleteBaseView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initAttributes()
    }

}

// MARK: - Attributes
extension MyPageLikeCell {
    private func initAttributes() {
        initVars()
        initBackgroundView()
        initThumbView()
        initDeleteView()
        initLabels()
    }
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initThumbView() {
        thumbBaseView.clipsToBounds = true
        thumbBaseView.layer.cornerRadius = 3
        
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.backgroundColor = kGRAY_200
    }
    
    private func initDeleteView() {
        deleteBaseView.backgroundColor = kCLEAR
        
        deleteButton.setTitle(nil, for: .normal)
        deleteButton.setImage(UIImage(named: "iconCancel"), for: .normal)
        deleteButton.tintColor = kWHITE
        // FIXME: 버튼 이미지 색
    }
    
    private func initLabels() {
        nameLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .bold)
        
        titleLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .regular)
        
        currentPriceLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .regular)
        currentPriceLabel.textColor = kPINK
        
        previousPriceLabel.font = UIFont.notoSansFont(ofSize: 12.0, weight: .regular)
        previousPriceLabel.textColor = kGRAY
    }
}

// MARK: -

extension MyPageLikeCell {
    func configure(_ item: DummyLike) {
        thumbImageView.image = UIImage(named: item.imageName)
        nameLabel.text = item.name
        titleLabel.text = item.title
        currentPriceLabel.text = item.currentPrice
        previousPriceLabel.text = item.previousPrice
    }
}

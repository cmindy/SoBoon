//
//  ProductDescriptionCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 24/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class ProductDescriptionCell: UITableViewCell {
    
    // MARK: - Vars
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var infoBaseView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var participantLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    
    // MARK: - LifeCycle
    
    private func initVars() {
        
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initInfoBaseView() {
        infoBaseView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
    }
    
    private func initLabels() {
        titleLabel.font = UIFont.notoSansFont(ofSize: 20, weight: .bold)
        titleLabel.text = "달콤한 갈비만두 나누실 분 구함!"
        
        descriptionLabel.textColor = kGRAY
        descriptionLabel.font = UIFont.notoSansFont(ofSize: 16, weight: .regular)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.text = "출출할 땐 간식으로, 술땡길 땐 안주로 제격인 갈비만두 같이 구매하실 분 구합니다!! 제가 먹어봤는데 진짜 존맛탱이었어요. 빠른 소분 원해요. "
        
        dateLabel.textColor = kGRAY
        dateLabel.font = UIFont.notoSansFont(ofSize: 16, weight: .bold)
        dateLabel.text = "2시간 2분 남음"
        
        participantLabel.textColor = kPINK_500
        participantLabel.font = UIFont.notoSansFont(ofSize: 16, weight: .bold)
        participantLabel.text = "2/6 참여"
        
        placeLabel.textColor = kGRAY
        placeLabel.font = UIFont.notoSansFont(ofSize: 14, weight: .medium)
        placeLabel.text = "oo대학교 예능관 픽업"
        
        previousPriceLabel.textColor =  kGRAY_LIGHT
        previousPriceLabel.font = UIFont.notoSansFont(ofSize: 14, weight: .medium)
        previousPriceLabel.text = "60,000원"
        let priceString = "60,000원"
        let attrString = GeneralHelper.sharedInstance.style(text: priceString,
                                           changeText: "60,000원",
                                           underLine: nil,
                                           strikeThroughLine: true,
                                           font: nil,
                                           color: nil,
                                           lineSpacing: nil)
        previousPriceLabel.attributedText = attrString
        
        currentPriceLabel.font = UIFont.notoSansFont(ofSize: 18, weight: .bold)
        currentPriceLabel.text = "10,000원"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initVars()
        initBackgroundView()
        initInfoBaseView()
        initLabels()
    }
}

// MARK: -

extension ProductDescriptionCell {
    
}

//
//  FeedDetailInfoCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 30/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedDetailInfoCell: UITableViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var participantLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!

    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
    }
    
    private func initLabels() {
        remainingTimeLabel.textColor = kGRAY
        remainingTimeLabel.font = UIFont.notoSansFont(ofSize: 16, weight: .bold)
        remainingTimeLabel.text = "2시간 2분 남음"
        
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
        initLabels()
    }
}

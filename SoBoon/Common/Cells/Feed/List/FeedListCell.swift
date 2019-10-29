//
//  FeedListCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 20/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

let kFeedListCellID = "FeedListCell"

class FeedListCell: UITableViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var thumbBaseView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var dateBaseView: UIView!
    @IBOutlet weak var dateBaseViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dividerView: UIImageView!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kCLEAR
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = kWHITE
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.backgroundColor = kWHITE_HIGHLIGHT
    }
    
    private func initThumbView() {
        thumbBaseView.clipsToBounds = true
        thumbBaseView.layer.cornerRadius = 4.0
        
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.backgroundColor = kGRAY_200
        thumbImageView.image = UIImage(named: "salad")
    }
    
    private func initDateBaseView() {
        dateBaseView.clipsToBounds = true
        dateBaseView.backgroundColor = UIColor(red: 211/255.0, green: 36/255.0, blue: 61/255.0, alpha: 0.8)
        dateBaseView.layer.cornerRadius = dateBaseViewHeightConstraint.constant / 2.0
        
        dateLabel.textColor = kWHITE
        dateLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        dateLabel.textAlignment = .center
        dateLabel.text = "2시간 2분"
    }
    
    private func initLabels() {
        titleLabel.textColor = kGRAY_800
        titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        titleLabel.numberOfLines = 2
        titleLabel.text = "[헬스앤뷰티] 더 부드러운 닭 가슴살(30개입) 나눔해요"
        
        infoLabel.textColor = kGRAY_400
        infoLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        infoLabel.text = "30,000원 / 3명"
        
        priceLabel.textColor = kGRAY_800
        priceLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        
        let priceString = "10,000원 소분가"
        let attrString = GeneralHelper.sharedInstance.style(text: priceString,
                                                            changeText: "소분가",
                                                            underLine: nil,
                                                            strikeThroughLine: nil,
                                                            font: nil,
                                                            color: kGRAY_300,
                                                            lineSpacing: nil)
        priceLabel.attributedText = attrString
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initThumbView()
        initDateBaseView()
        initLabels()
    }
}

// MARK: - Extension

extension FeedListCell {
    
    func divider(_ divider: Bool) {
        dividerView.isHidden = !divider
    }
}

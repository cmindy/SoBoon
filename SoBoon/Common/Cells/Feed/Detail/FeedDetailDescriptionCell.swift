//
//  FeedDetailDescriptionCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 29/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedDetailDescriptionCell: UITableViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initLabels() {
        descriptionLabel.textColor = kGRAY
        descriptionLabel.font = UIFont.notoSansFont(ofSize: 16.0, weight: .regular)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.text = "출출할 땐 간식으로, 술땡길 땐 안주로 제격인 갈비만두 같이 구매하실 분 구합니다!! 제가 먹어봤는데 진짜 존맛탱이었어요. 빠른 소분 원해요. "
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initLabels()
    }
}

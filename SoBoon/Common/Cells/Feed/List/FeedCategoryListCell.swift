//
//  FeedCategoryListCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 17/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedCategoryListCell: UICollectionViewCell {

    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initImageView() {
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.image = UIImage(named: "icon_people")?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = kGRAY_800
    }
    
    private func initLabel() {
        titleLabel.textColor = kGRAY_800
        titleLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        titleLabel.textAlignment = .center
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initImageView()
        initLabel()
    }

}

// MARK: - Extension

extension FeedCategoryListCell {
    
    func configure(title: String?) {
        titleLabel.text = title
    }
    
}

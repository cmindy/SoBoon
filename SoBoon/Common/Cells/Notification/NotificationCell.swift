//
//  NotificationCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 30/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var profileBaseView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contentBaseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbBaseView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!

    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        attributes()
    }
}

// MARK: - Attributes
extension NotificationCell {
    func attributes() {
        initVars()
        initBackgroundView()
        initProfileView()
        initLabels()
    }
    
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
    
    private func initProfileView() {
        profileImageView.clipsToBounds = true
        profileImageView.roundCorners()
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.backgroundColor = kGRAY_200
    }
    
    private func initThumbView() {
        thumbImageView.clipsToBounds = true
        thumbImageView.layer.cornerRadius = 2.0
        
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.backgroundColor = kGRAY_200
    }
    
    private func initLabels() {
        titleLabel.font = UIFont.notoSansFont(ofSize: 16.0, weight: .medium)
        titleLabel.numberOfLines = 2
        
        descriptionLabel.font = UIFont.notoSansFont(ofSize: 13.0, weight: .regular)
    }
}

// MARK: -

extension NotificationCell {
    func configure(_ item: DummyNotification) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        profileImageView.image = item.profileImage
        thumbImageView.image = item.thumbImage
    }
}

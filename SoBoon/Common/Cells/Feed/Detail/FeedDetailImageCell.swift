//
//  FeedDetailImageCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 26/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedDetailImageCell: UITableViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var linkBaseView: UIView!
    @IBOutlet weak var linkButton: UIButton!

    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kCLEAR
    }
    
    private func initImageView() {
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.backgroundColor = kGRAY
//        thumbImageView.image = UIImage(named: "image_0")
    }
    
    private func initLinkBaseView() {
        linkBaseView.clipsToBounds = true
        linkBaseView.layer.cornerRadius = 2.0
        linkBaseView.backgroundColor = kBLACK_ALPHA
    }
    
    private func initLinkButton() {
        linkButton.titleLabel?.font = UIFont.notoSansFont(ofSize: 14.0, weight: .regular)
        linkButton.titleLabel?.textAlignment = .center
        linkButton.setTitleColor(kWHITE, for: .normal)
        linkButton.setTitle("상품 링크", for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initImageView()
        initLinkBaseView()
        initLinkButton()
    }
}

// MARK: -

extension FeedDetailImageCell {
    func configure(image name: FeedDetailImage) {
        imageView?.image = UIImage(named: name.imageName)
    }
}

//
//  CommentCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 24/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initProfileImageView() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.backgroundColor = kGRAY_200
        profileImageView.roundCorners()
    }
    
    private func initLabels() {
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        commentLabel.textColor = kGRAY
        commentLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        dateLabel.textColor = kGRAY_LIGHT
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initProfileImageView()
        initLabels()
    }

}

// MARK: -

extension CommentCell {
    
    func entity(item: DummyComment) {
        nameLabel.text = item.name
        commentLabel.text = item.comment
        dateLabel.text = item.date
    }
}

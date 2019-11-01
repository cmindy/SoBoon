//
//  MyPageProfileHeaderView.swift
//  SoBoon
//
//  Created by CHOMINJI on 01/11/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class MyPageProfileHeaderView: UITableViewHeaderFooterView {

    // MARK: - Vars
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileBaseView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var participatedLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var participatedButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initAttributes()
    }
}

// MARK: - Attributes

extension MyPageProfileHeaderView {
    private func initAttributes() {
        initVars()
        initBackgroundView()
        initProfileView()
        initLabels()
        initButtons()
    }
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initProfileView() {
        profileImageView.clipsToBounds = true
        profileImageView.roundCorners()
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.backgroundColor = kGRAY_200
        // TODO: set defaut profile image
        profileImageView.image = UIImage(named: "iconEdit")
    }
    
    private func initLabels() {
        nameLabel.font = UIFont.notoSansFont(ofSize: 18.0, weight: .bold)
        nameLabel.text = "쥬만지"

        let soBoonLabels = [myLabel, likeLabel, likeLabel]
        soBoonLabels.forEach { label in
              if let label = label {
                  label.font = UIFont.notoSansFont(ofSize: 18.0, weight: .bold)
                  label.textColor = kGRAY
              }
          }
//        myLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .medium)
//        myLabel.textColor = kGRAY
        myLabel.text = "내 소분"

//        participatedLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .medium)
//        participatedLabel.textColor = kGRAY
        participatedLabel.text = "참여한 소분"

//        likeLabel.font = UIFont.notoSansFont(ofSize: 14.0, weight: .medium)
//        likeLabel.textColor = kGRAY
        likeLabel.text = "찜한 소분"
    }
    
    private func initButtons() {
        editButton.setTitleColor(kGRAY_LIGHT, for: .normal)
        editButton.setTitle("프로필 편집", for: .normal)
        
        let soBoonButtons = [myButton, participatedButton, likeButton]
        soBoonButtons.forEach { button in
            if let button = button {
                button.setTitleColor(kPINK, for: .normal)
            }
        }
    }
}

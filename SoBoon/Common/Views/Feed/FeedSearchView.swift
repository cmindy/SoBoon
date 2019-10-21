//
//  FeedSearchView.swift
//  SoBoon
//
//  Created by CHOMINJI on 17/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedSearchView: BaseCustomView {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kCLEAR
        
        shadowView.backgroundColor = kCLEAR
        shadowView.dropShadow(bounds: CGRect(origin: CGPoint(x: 0.0, y: 4.0), size: CGSize(width: kDEVICE_WIDTH - 32.0, height: 34.0)), cornerRadius: 4.0)
    }
    
    private func initSearchView() {
        searchView.backgroundColor = kWHITE
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 4.0
    }
    
    private func initImageView() {
        iconImageView.image = UIImage(named: "icon_search")?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = kGRAY_800
    }
    
    private func initTextField() {
        searchTextField.textColor = kGRAY_800
        searchTextField.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        searchTextField.placeholder = "소분할 물품을 검색해주세요."
        searchTextField.clearButtonMode = .whileEditing
        searchTextField.delegate = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initSearchView()
        initImageView()
        initTextField()
    }
    
}

// MARK: - Extension
// MARK: - UITextField

extension FeedSearchView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

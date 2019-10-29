//
//  GeneralEmptyFooterView.swift
//  SoBoon
//
//  Created by CHOMINJI on 18/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class GeneralEmptyFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kGRAY_100
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
    }
    
}

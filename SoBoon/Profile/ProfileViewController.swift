//
//  ProfileViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 15/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    // MARK: - Vars
    
    @IBOutlet weak var navigationView: GeneralNavigationView!

    // MARK: - Life Cycle
    
    func initVars() {
        self.isShowBigTitle = true
    }
    
    func initBackgroundView() {
        self.view.backgroundColor = kWHITE
    }
    
    func initNavigationView() {
        self.navigationView.showBigTitle(bigTitle: self.isShowBigTitle)
        self.navigationView.bgColor(kWHITE)
        self.navigationView.titleColor(kGRAY_800)
        self.navigationView.title("Profile")
        self.navigationView.bigTitle("Profile")
        self.navigationView.divider(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initVars()
        self.initBackgroundView()
        self.initNavigationView()
    }

}

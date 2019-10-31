//
//  MyPageViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 15/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class MyPageViewController: BaseViewController {

    // MARK: - Vars
    
    @IBOutlet weak var navigationView: GeneralNavigationView!
    @IBOutlet weak var profileTableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initAttributes()
    }

}

// MARK: - Attributes

extension MyPageViewController {
    private func initAttributes() {
        self.initVars()
        self.initBackgroundView()
        self.initNavigationView()
    }
    
    private func initVars() {
        self.isShowBigTitle = false
    }
    
    private func initBackgroundView() {
        self.view.backgroundColor = kWHITE
    }
    
    private func initNavigationView() {
        self.navigationView.showBigTitle(bigTitle: self.isShowBigTitle)
        self.navigationView.bgColor(kWHITE)
        self.navigationView.titleColor(kGRAY_800)
        self.navigationView.title("마이페이지")
        self.navigationView.divider(false)
        self.navigationView.naviButtonColor(color: kGRAY_700)
        self.navigationView.showBackButton()
        self.setInteractiveRecognizer()
    }
}

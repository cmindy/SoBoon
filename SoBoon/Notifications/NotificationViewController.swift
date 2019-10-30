//
//  NotificationViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 07/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit


class NotificationViewController: BaseViewController {

    // MARK: - Vars
    
    @IBOutlet weak var navigationView: GeneralNavigationView!
    @IBOutlet weak var notificationTableView: UITableView!

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
        self.navigationView.title("Notification")
        self.navigationView.divider(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initVars()
        self.initBackgroundView()
        self.initNavigationView()
    }

}

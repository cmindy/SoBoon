//
//  SplashViewController.swift
//  SoBoon
//
//  Created by CHOMINJI on 15/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    
     // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.startApp()
    }
}

// MARK: - Event

extension SplashViewController {
    
    func startApp() {
        GeneralHelper.sharedInstance.appDelegate.creatBaseViewController()
    }
    
}



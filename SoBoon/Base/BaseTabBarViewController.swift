//
//  BaseTabBarViewController.swift
//  NewOPGG
//
//  Created by Jiyoun Moon on 2018. 6. 26..
//  Copyright © 2018년 Genetory. All rights reserved.
//

import UIKit

class FixedTabBar: UITabBar {
    var itemFrames = [CGRect]()
    var tabBarItems = [UIView]()

    override func layoutSubviews() {
        super.layoutSubviews()

        if self.itemFrames.isEmpty, let UITabBarButtonClass = NSClassFromString("UITabBarButton") as? NSObject.Type {
            self.tabBarItems = subviews.filter({$0.isKind(of: UITabBarButtonClass)})
            self.tabBarItems.forEach({self.itemFrames.append($0.frame)})
        }

        if !self.itemFrames.isEmpty, !self.tabBarItems.isEmpty, self.itemFrames.count == items?.count {
            self.tabBarItems.enumerated().forEach({$0.element.frame = self.itemFrames[$0.offset]})
        }
    }
    
}

class BaseTabBarViewController: UITabBarController {

    // MARK: - Vars
    
    var pageIndex: Int! = 0
    var selectedTabIdx: Int = 0
        
    // MARK: - Life Cycle
    
    func initVars() {
        self.delegate = self
    }
    
    func initBackgroundView() {

    }

    func initTabBar() {
        self.tabBar.isHidden = true
                
        let floatingTabbar = Bundle.main.loadNibNamed("FloatingTabbar", owner: self, options: nil)?[0] as! FloatingTabbar
        floatingTabbar.frame = CGRect.init(origin: CGPoint.init(x: (kDEVICE_WIDTH - 224.0) / 2.0, y: kDEVICE_HEIGHT - 82.0), size: CGSize.init(width: 224.0, height: 50.0))
        floatingTabbar.delegate = self
        self.view.addSubview(floatingTabbar)

        if let tabBarItems = self.tabBar.items {
            for (index, tabItem) in GeneralHelper.sharedInstance.tabList.enumerated() {
                tabBarItem.tag = index
                
                let tabBarItem: UITabBarItem = tabBarItems[index]
                tabBarItem.title = tabItem.title
            }
        }
    }
    
    func initViewControllers() {
        var controllers: [UINavigationController] = []
        
        for tabItem in GeneralHelper.sharedInstance.tabList {
            var storyBoard: String?
            var controller: String?
            
            if tabItem.type == .feed {
                storyBoard = "Feed"
                controller = "FeedViewController"
            }
            else if tabItem.type == .post {
                storyBoard = "Feed"
                controller = "FeedViewController"
            }
            else if tabItem.type == .notification {
                storyBoard = "Notification"
                controller = "NotificationViewController"
            }
            else if tabItem.type == .profile {
                storyBoard = "Profile"
                controller = "ProfileViewController"
            }

            if let storyBoard = storyBoard,
                let controller = controller {
                let vc: BaseViewController = GeneralHelper.sharedInstance.makeViewController(sb: storyBoard,
                                                                                             vc: controller)
                vc.tabItem = tabItem
                
                let nc: UINavigationController = UINavigationController.init(rootViewController: vc)
                controllers.append(nc)
            }
        }
        
        self.viewControllers = controllers
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initVars()
        self.initBackgroundView()
        self.initViewControllers()
        self.initTabBar()

        if let viewControllers = self.viewControllers {
            self.selectedViewController = viewControllers[self.selectedTabIdx]
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.tabBar.invalidateIntrinsicContentSize()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

}

// MARK: - BaseTabBarViewController

extension BaseTabBarViewController: UITabBarControllerDelegate {
    
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if let nc = viewController as? UINavigationController {
//            if nc.viewControllers.count > 0 {
//                if let _ = nc.viewControllers[0] as? PostEmptyViewController {
//                    self.doPost(sender: nil)
//                    return false
//                }
//            }
//        }
//
//        return true
//    }
    
}

// MARK:  - FloatingTabbar

extension BaseTabBarViewController: FloatingTabbarDelegate {
    
    func didButtonFloatingTabbar(view: FloatingTabbar, idx: Int) {
        view.refreshTabbar(idx: idx)
        
        if let viewControllers = self.viewControllers {
            self.selectedViewController = viewControllers[idx]
        }
    }
    
}


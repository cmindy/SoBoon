//
//  GeneralHelper.swift
//  HeyDealer
//
//  Created by GENETORY on 13/08/2019.
//  Copyright © 2019 GENETORY. All rights reserved.
//

import UIKit
import AudioToolbox

class GeneralHelper: NSObject {

    // MARK: - Vars
    
    var tabList: [TabItem] = []

    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String

    static let sharedInstance = GeneralHelper()
    
    // MARK: - Life Cycle
    
    func setup() {
        self.initTabList()
    }

}

// MARK: - Tab

extension GeneralHelper {
    
    func initTabList() {
        let homeItem = TabItem(title: "Feed", iconImage: "icon_home", type: .feed)
        let postItem = TabItem(title: "Post", iconImage: "icon_post", type: .post)
        let notiItem = TabItem(title: "Notifiication", iconImage: "icon_notification", type: .notification)
        let profileItem = TabItem(title: "Profile", iconImage: "icon_profile", type: .profile)
        
        self.tabList = [homeItem, postItem, notiItem, profileItem]
    }
    
}

// MARK: - Attributed

extension GeneralHelper {
    
    func style(text: String,
               changeText: String,
               underLine: Bool?,
               font: UIFont?,
               color: UIColor?,
               lineSpacing: CGFloat?) -> NSAttributedString {
        let range = (text as NSString).range(of: changeText)
        let attributedString = NSMutableAttributedString(string: text)
        
        if let _ = underLine {
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: range)
        }
        
        if let font = font {
            attributedString.addAttribute(NSAttributedString.Key.font, value: font , range: range)
        }
        
        if let color = color {
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: range)
        }
        
        if let lineSpacing = lineSpacing {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: NSMakeRange(0, attributedString.length))
        }
        
        return attributedString
    }
    
}

// MARK: - Make ViewController

extension GeneralHelper {

    func makeViewController(sb storyBoard: String, vc viewController: String) -> BaseViewController {
        let sb = UIStoryboard.init(name: storyBoard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewController) as! BaseViewController
        
        return vc
    }
    
    func makeTabBarViewController(sb storyBoard: String, vc viewController: String) -> BaseTabBarViewController {
        let sb: UIStoryboard = UIStoryboard.init(name: storyBoard, bundle: nil)
        let vc: BaseTabBarViewController = sb.instantiateViewController(withIdentifier: viewController) as! BaseTabBarViewController
        
        return vc
    }

}

// MARK: - Vibrate

extension GeneralHelper {
    
    func doVibrate() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }

}

//
//  FloatingTabbar.swift
//  Soboon
//
//  Created by GENETORY on 05/10/2019.
//  Copyright © 2019 GENETORY. All rights reserved.
//

import UIKit

protocol FloatingTabbarDelegate: class {
    func didButtonFloatingTabbar(view: FloatingTabbar, idx: Int)
}

class FloatingTabbar: UIView {

    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var buttonList: [UIButton] = []

    weak var delegate: FloatingTabbarDelegate?
    
    // MARK: - Life Cycle
    
    func initVars() {
        self.buttonList = [self.button1, self.button2, self.button3, self.button4]
    }
    
    func initBackgroundView() {
        self.baseView.backgroundColor = kCLEAR
        
        self.baseView.dropShadow(bounds: self.baseView.bounds, cornerRadius: 25.0)
    }
    
    func initButtons() {
        for (idx, button) in self.buttonList.enumerated() {
            button.tag = idx

            button.addTarget(self, action: #selector(doButton(button:)), for: .touchUpInside)
            
            if let iconImage = GeneralHelper.sharedInstance.tabList[idx].iconImage {
                button.setImage(UIImage.init(named: iconImage)?.withRenderingMode(.alwaysTemplate), for: .normal)
                button.setImage(UIImage.init(named: iconImage)?.withRenderingMode(.alwaysTemplate), for: .highlighted)
                button.setImage(UIImage.init(named: iconImage)?.withRenderingMode(.alwaysTemplate), for: .disabled)
                button.tintColor = kGRAY_400
            }
            
            if idx == 0 {
                button.tintColor = kMAIN_500
                button.isEnabled = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.initVars()
        self.initBackgroundView()
        self.initButtons()
    }
    
}

// MARK: - Event

extension FloatingTabbar {
    
    @objc
    func doButton(button: UIButton) {
        self.delegate?.didButtonFloatingTabbar(view: self, idx: button.tag)
    }
    
}

// MARK: - RefreshUI

extension FloatingTabbar {
    
    func refreshTabbar(idx: Int) {
        print(idx)
        for button in self.buttonList {
            button.tintColor = button.tag == idx ? kMAIN_500 : kGRAY_400
            button.isEnabled = button.tag == idx ? false : true
        }
    }
    
}

//
//  InteractivePopRecognizer.swift
//  HeyDealer
//
//  Created by GENETORY on 13/08/2019.
//  Copyright © 2019 GENETORY. All rights reserved.
//

import UIKit

class InteractivePopRecognizer: NSObject {
    
    var navigationController: UINavigationController
    
    init(controller: UINavigationController) {
        self.navigationController = controller
    }
    
}

// MARK: - UIGestureRecognizer Delegate

extension InteractivePopRecognizer: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController.viewControllers.count > 1
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }

}

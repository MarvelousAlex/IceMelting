//
//  Utilities.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import Foundation
import UIKit

final class Utilities {
    static let shared = Utilities()
    private init() {   }
    
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController // we don't have the multiple scenes, so it's not a problem here~~
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

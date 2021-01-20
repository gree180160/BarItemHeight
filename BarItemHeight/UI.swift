//
//  UI.swift
//  BarItemHeight
//
//  Created by WillowRivers on 2021/1/8.
//

import UIKit
import CoreTelephony
import AuthenticationServices

struct UI {
    static let screenSize: CGSize = UIScreen.main.bounds.size
    static let screenWidth: CGFloat = screenSize.width
    static let screenHeigth: CGFloat = screenSize.height
    
     static var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            let statusManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
            return statusManager?.statusBarFrame.height ?? 20.0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }

    static var navigationBarHeight: CGFloat {
        return 44.0
    }
    
    static var navigationBarMaxY: CGFloat {
        return 44 + statusBarHeight;
    }
    
    static var homeBarHeight: CGFloat {
        var height: CGFloat = 0
        if AppAndDeviceInfo.deviceIsiPhone() {
            if statusBarHeight >= 44 { //刘海屏幕手机，有homeBar
                height = 34
            }else {
                height = 0
            }
            return height
        }
        if AppAndDeviceInfo.deviceIsiPad() {
            if tabBarHeight >= 51 {
                height = 15.0
            }else {
                height = 0.0
            }
        }
        return height
    }
    
    /// method 1.   先取tabBar 获取到高度，直接新建的tabBarContrller 无法获取正确高度，
    static var tabBarHeight: CGFloat { // include homeBar
        //此处为提高内聚性，显的些许麻烦。（读者可以设置改属性为存储属性，在delegate 中赋值，然后再使用）
        guard let tabVC: UITabBarController = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController else {
            return getTabbarheightByDeviceInfo()
        }
        return tabVC.tabBar.frame.size.height
    }
    
    /// method 2.  可以在设置UITabBarController 后，对其赋值，然后使用
    static var storedTabBarHeight:CGFloat?
    
    /// method 3.  对于未来设备，判断可能出错 & ipad同一设备不同iOS 版本高度也会不同
    /// - Returns: description
    static func getTabbarheightByDeviceInfo() -> CGFloat {
        if AppAndDeviceInfo.deviceIsiPhone() {
            if statusBarHeight > 21.0 {
                return 83
            }
            return 0.0
        }else if AppAndDeviceInfo.deviceIsiPad() {
            if statusBarHeight > 23.0 {
                return 65.0 // 实际情况下，可能为 50，或者65
            }else {
                return 50.0
            }
        }else {
            return 0.0
        }
    }
}

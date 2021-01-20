//
//  AppAndDeviceInfo.swift
//  BarItemHeight
//
//  Created by WillowRivers on 2021/1/8.
//

import UIKit
import CoreTelephony
import AuthenticationServices

struct AppAndDeviceInfo {
     /// 设备是否是iphone， 模拟器不可用
    /// - Returns: description
    static func deviceIsiPhone() -> Bool {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        //模拟器x86-64
        return identifier.contains("iPhone")
    }
    
     /// 设备是否为iPad， 模拟器不可用
    /// - Returns: description
    static func deviceIsiPad() -> Bool {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        //模拟器x86-64
        return identifier.contains("iPad")
    }
}



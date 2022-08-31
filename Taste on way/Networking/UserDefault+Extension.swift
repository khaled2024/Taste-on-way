//
//  UserDefault+Extension.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 01/09/2022.
//

import Foundation
extension UserDefaults{
    private enum UserDefaultKeys: String{
        case hasOnboarded
    }
    var hasOnboarded: Bool{
        get{
            bool(forKey: UserDefaultKeys.hasOnboarded.rawValue)
        }
        set{
            set(newValue, forKey: UserDefaultKeys.hasOnboarded.rawValue)
        }
    }
}

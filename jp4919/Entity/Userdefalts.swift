//
//  Userdefalts.swift
//  jp4919
//
//  Created by shogo-ka on 2018/07/29.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import Foundation

protocol KeyNamespaceable {
    func namespaced<T: RawRepresentable>(_ key: T) -> String
}

extension KeyNamespaceable {
    
    func namespaced<T: RawRepresentable>(_ key: T) -> String {
        return "\(Self.self).\(key.rawValue)"
    }
}

protocol StringDefaultSettable : KeyNamespaceable {
    associatedtype StringKey : RawRepresentable
}

extension StringDefaultSettable where StringKey.RawValue == String {
    
    func set(_ value: String, forKey key: StringKey) {
        let key = namespaced(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func removeObject(forKey key: StringKey)  {
        let key = namespaced(key)
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    @discardableResult
    func string(forKey key: StringKey) -> String? {
        let key = namespaced(key)
        return UserDefaults.standard.string(forKey: key)
    }
}

extension UserDefaults : StringDefaultSettable {
    enum StringKey : String {
        case areaName
        case schoolName
        case distributorId
    }
}

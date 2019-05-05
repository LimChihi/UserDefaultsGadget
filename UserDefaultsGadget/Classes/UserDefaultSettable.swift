//
//  UserDefaultSettable.swift
//  UserDefaultsGadget
//
//  Created by linzhiyi on 2019/5/5.
//

import Foundation

public protocol UserDefaultSettable {
    var uniqueKey: String { get }
}

extension UserDefaultSettable where Self: RawRepresentable, Self.RawValue == String {
    
    public var uniqueKey: String {
        return "com.limchihi.userdefaultsgadget.\(Self.self).\(self.rawValue)"
    }
    
    public func store(value: Any?) {
        userDefaults.set(value, forKey: uniqueKey)
    }
    
    public func removeValue() {
        userDefaults.removeObject(forKey: uniqueKey)
    }
    
    public var value: Any? {
        return UserDefaults.standard.object(forKey: uniqueKey)
    }
    
    public var stringValue: String? {
        return value as? String
    }
    
    public var urlValue: URL? {
        return value as? URL
    }
    
    public var boolValue: Bool? {
        return value as? Bool
    }
    
    public var floatValue: Float? {
        return value as? Float
    }
    
    public var doubleValue: Double? {
        return value as? Double
    }
    
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
}


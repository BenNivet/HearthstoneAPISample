//
//  Session.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

protocol StringEnum {
    var rawValue: String { get }
}

class Context: NSObject {
    // Keys to store values
    typealias Key = String
    
    // Properties
    private var dictionary = [Key: Any]()
    
    // Subscript
    subscript(enumKey: StringEnum) -> Any? {
        get {
            return dictionary[description(for: enumKey)]
        }
        set {
            dictionary[description(for: enumKey)] = newValue
        }
    }
    
    private func description(for enumKey: StringEnum) -> String {
        return "\(type(of: enumKey)).\(enumKey.rawValue)"
    }
    
    fileprivate func dump() {
        for key in dictionary.keys {
            Logger.info("\(key) - \(dictionary[key]!)")
        }
    }
}

private class SessionHandler {
    static let shared = SessionHandler()
    var session: Session?
}

class Session {
    
    // Class property
    class var current: Session? {
        if SessionHandler.shared.session == nil {
            SessionHandler.shared.session = Session()
        }
        return SessionHandler.shared.session
    }
    
    // Class method to clear the session
    class func clear() {
        SessionHandler.shared.session = nil
    }
    
    // Properties
    var appContext = Context()
    
    fileprivate func dump() {
        Logger.info("------ App Context")
        appContext.dump()
    }
    
}

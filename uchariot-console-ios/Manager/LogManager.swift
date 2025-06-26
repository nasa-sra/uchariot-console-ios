//
//  LogManager.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/26/25.
//

import Foundation

class LogManager {
    static var text = ""
    
    static func log(_ str: String) {
        text += "\(str)\n"
    }
    
    static func clear() {
        text = ""
    }
}

//
//  ConsoleApp.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/18/25.
//

import SwiftUI

@main
struct ConsoleApp: App {
    @StateObject var robotManager = RobotManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(robotManager)
        }
    }
}

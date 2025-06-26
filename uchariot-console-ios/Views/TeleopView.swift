//
//  StatusView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/19/25.
//

import SwiftUI

struct TeleopView: View {
    @Binding var robotState: NavigationView.RobotState
    
    var body: some View {
        VStack {
            CameraFeed()
            JoystickController()
            Spacer()
        }
        .padding([.top])
        .onAppear {
            if robotState == .enabled {
                robotState = .disabled
            }
        }
    }
}

#Preview {
    TeleopView(robotState: .constant(.disabled))
}

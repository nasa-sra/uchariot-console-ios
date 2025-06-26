//
//  DataView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/22/25.
//

import SwiftUI

struct DataView: View {
    @Binding var robotState: NavigationView.RobotState
    
    var body: some View {
        Text("Data View")
            .onAppear {
                if robotState == .enabled {
                    robotState = .disabled
                }
            }
    }
}

#Preview {
    DataView(robotState: .constant(.disabled))
}

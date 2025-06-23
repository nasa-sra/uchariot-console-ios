//
//  NavigationView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/22/25.
//

import SwiftUI

struct NavigationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var robotState = RobotState.disabled
    
    enum RobotState {
        case enabled, disabled
    }
    
    var body: some View {
        TabView {
            TeleopView(robotState: $robotState)
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Teleop")
                }
            AutonomousView(robotState: $robotState)
                .tabItem {
                    Image(systemName: "cpu.fill")
                    Text("Autonomous")
                }
            DataView(robotState: $robotState)
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Data")
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.body)
                            .fontWeight(.semibold)
                            .padding(0)
                        
                        Text("Disconnect")
                    }
                }
            }
            
            ToolbarItem(placement: .principal) {
                Button {
                    if robotState == .enabled {
                        robotState = .disabled
                    } else {
                        robotState = .enabled
                    }
                } label: {
                    Text(robotState == .enabled ? "ENABLED" : "DISABLED")
                        .foregroundStyle(robotState == .enabled ? .green : .red)
                        .bold()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text("12.8V")
                        .foregroundStyle(.accent)
                    Image(systemName: "bolt.batteryblock.fill")
                        .foregroundStyle(.accent)
                }
            }
        }
    }
}

#Preview {
    NavigationView()
}

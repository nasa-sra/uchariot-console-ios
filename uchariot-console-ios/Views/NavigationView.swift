//
//  NavigationView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/22/25.
//

import SwiftUI

struct NavigationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        TabView {
            TeleopView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Teleop")
                }
            AutonomousView()
                .tabItem {
                    Image(systemName: "cpu.fill")
                    Text("Autonomous")
                }
            DataView()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Data")
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
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
            
            ToolbarItem(placement: .navigationBarTrailing) {
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

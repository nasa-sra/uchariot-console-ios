//
//  DataView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/22/25.
//

import SwiftUI

struct DataView: View {
    @Binding var robotState: NavigationView.RobotState
    @State var logText = ""
    
    var body: some View {
        VStack {
            ZStack {
                Color.gray.opacity(0.25)
                
                Text(logText)
                    .truncationMode(.head)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(4)
            }
            .frame(width: 350, height: 275)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Spacer()
        }
        .onAppear {
            if robotState == .enabled {
                robotState = .disabled
            }
        }
        .onChange(of: LogManager.text) {
            logText = LogManager.text
        }
    }
}

#Preview {
    DataView(robotState: .constant(.disabled))
}

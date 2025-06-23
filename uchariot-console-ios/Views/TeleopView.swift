//
//  StatusView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/19/25.
//

import SwiftUI

struct TeleopView: View {
    var body: some View {
        VStack {
            CameraFeed()
                .padding()
            
            JoystickController()
            Spacer()
        }
    }
}

#Preview {
    TeleopView()
}

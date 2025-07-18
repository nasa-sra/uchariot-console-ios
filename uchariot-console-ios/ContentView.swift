//
//  ContentView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/18/25.
//

import SwiftUI

struct ContentView: View {
    @State var ipText = "uchariot-base.local"
    @State var connected = false
    @State var connecting = false
    @FocusState private var isFocused: Bool
    @EnvironmentObject var robotManager: RobotManager

    var body: some View {
        NavigationStack {
            ZStack {
                Image("Moonscape")
                    .ignoresSafeArea()
                    .onTapGesture {
                        isFocused = false
                    }

                VStack {
                    TextField("IP Address", text: $ipText)
                        .foregroundStyle(.white)
                        .keyboardType(.decimalPad)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .multilineTextAlignment(.center)
                        .focused($isFocused)

                    Button {
                        connecting = true
                        Task {
                            await robotManager.connect(ip: ipText)
                        }
                    } label: {
                        Group {
                            if connecting {
                                Text("Connecting...")
                            } else {
                                Text("Connect")
                            }
                        }
                        .foregroundStyle(.white)
                        .padding(8)
                    }
                    .background(.accent, in: RoundedRectangle(cornerRadius: 8))
                    .disabled(connecting)
                    .opacity(connecting ? 0.5 : 1.0)
                }
            }
            .navigationDestination(isPresented: $connected) {
                NavigationView()
            }
            .onReceive(robotManager.$isConnected) { newValue in
                connected = newValue
                if newValue {
                    connecting = false
                }
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(RobotManager())
}

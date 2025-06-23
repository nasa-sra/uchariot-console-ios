//
//  ContentView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/18/25.
//

import SwiftUI

struct ContentView: View {
    @State var ipText = "192.168.5.1"
    @State var connected = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Moonscape")
                    .ignoresSafeArea()
                    .onTapGesture {
                        isFocused = false
                    }
                
                VStack {
                    HStack {
                        TextField("IP Address", text: $ipText)
                            .foregroundStyle(.white)
                            .padding(0)
                            .keyboardType(.decimalPad)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                            .multilineTextAlignment(.center)
                            .focused($isFocused)
                    }
                    
                    Button {
                        connected.toggle()
                    } label: {
                        Text("Connect")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationDestination(isPresented: $connected) {
                NavigationView()
            }
        }
    }
}

#Preview {
    ContentView()
}

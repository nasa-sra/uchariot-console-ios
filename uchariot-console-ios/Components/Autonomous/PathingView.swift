//
//  PathingView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/23/25.
//

import SwiftUI

struct PathingView: View {
    @State var autonomousPathFile = "AutonPath.xml"
    @FocusState.Binding var focusState: Bool
    
    var body: some View {
        VStack {
            TextField("Autonomous path file", text: $autonomousPathFile)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.none)
                .padding([.horizontal])
                .focused($focusState)
            
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        Color.accent
                        
                        Text("Reset Pose")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(width: 100)
                    }
                    .frame(height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        Color.accent
                        
                        Text("Reset Heading")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(width: 100)
                    }
                    .frame(height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding([.horizontal])
            
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        Color.green
                        
                        Text("START")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(width: 60, height: 30)
                    }
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        Color.red
                        
                        Text("STOP")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(width: 60, height: 30)
                    }
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

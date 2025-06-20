//
//  CameraFeed.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/20/25.
//

import SwiftUI

struct CameraFeed: View {
    @State var isConnected = false
    
    var body: some View {
        ZStack {
            Image("Moonscape")
                .resizable()
            
            if isConnected {
                HStack {
                    VStack {
                        Spacer()
                        Button {
                            isConnected.toggle()
                        } label: {
                            Image(systemName: "eye.fill")
                                .foregroundStyle(.white)
                                .scaleEffect(2)
                                .padding()
                        }
                    }
                    Spacer()
                    VStack {
                        CameraButtons()
                    }
                }
            } else {
                Button {
                    isConnected.toggle()
                } label: {
                    VStack {
                        Image(systemName: "eye.slash")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                            .bold()
                        Text("Tap to enable live feed")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .padding()
                }
            }
        }
        .frame(width: 350, height: 350)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CameraFeed()
}

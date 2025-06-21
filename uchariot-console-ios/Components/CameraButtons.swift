//
//  CameraButtons.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/20/25.
//

import SwiftUI

struct CameraButtons: View {
    @State var isRecording = false
    
    var takePhoto: some View {
        Button {
            
        } label: {
            ZStack {
                Image(systemName: "circle")
                    .foregroundStyle(.white)
                    .scaleEffect(2)
                    .fontWeight(.light)
                    .padding()
                
                Image(systemName: "circle.fill")
                    .foregroundStyle(.white)
                    .scaleEffect(1.5)
                    .padding()
            }
        }
    }
    
    var takeVideo: some View {
        Button {
            isRecording.toggle()
        } label: {
            ZStack {
                Image(systemName: "circle")
                    .foregroundStyle(.red)
                    .scaleEffect(2)
                    .fontWeight(.light)
                    .padding()
                
                if isRecording {
                    Image(systemName: "square.fill")
                        .foregroundStyle(.red)
                        .scaleEffect(1)
                        .padding()
                } else {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(.red)
                        .scaleEffect(1.5)
                        .padding()
                }
            }
        }
    }
    
    var spacer: some View {
        Image(systemName: "circle.fill")
            .foregroundStyle(.red)
            .scaleEffect(2)
            .opacity(0)
            .padding()
    }
    
    var body: some View {
        takeVideo
        Spacer()
        takePhoto
    }
}

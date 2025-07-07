//
//  JoystickController.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/20/25.
//

import SwiftUI

struct JoystickController: View {
    @EnvironmentObject private var robotManager: RobotManager
    @State private var offset = CGSize.zero
    
    func restrict(_ translation: CGSize) -> CGSize {
        if distance(translation) > 64 {
            return translation.applying(
                CGAffineTransform(
                    scaleX: 64/distance(translation),
                    y: 64/distance(translation)))
        }
        return translation
    }
    
    func normalize(_ translation: CGSize) -> CGSize {
        return translation.applying(CGAffineTransform(scaleX: 1/64, y: -1/64))
    }
    
    func distance(_ translation: CGSize) -> Double {
        return sqrt(translation.width.magnitudeSquared + translation.height.magnitudeSquared)
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "circle")
                .scaleEffect(3)
                .frame(width: 300, height: 200)
                .foregroundStyle(.accent)
                .onTapGesture { location in
                    print(location.debugDescription)
                }
            
            Image(systemName: "circle.fill")
                .scaleEffect(5)
                .offset(offset)
                .foregroundStyle(.accent)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = restrict(value.translation)
                        }
                        .onEnded { value in
                            offset = CGSize.zero
                        }
                )
        }
        .onChange(of: offset) {
            let normalized = normalize(offset)
            robotManager.drive(velocity: normalized.height, rotation: normalized.width)
        }
    }
}

#Preview {
    JoystickController()
}

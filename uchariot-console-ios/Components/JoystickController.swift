//
//  JoystickController.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/20/25.
//

import SwiftUI

struct JoystickController: View {
    @State private var offset = CGSize.zero
    
    func normalized(translation: CGSize) -> CGSize {
        if distance(translation: translation) > 64 {
            return translation.applying(
                CGAffineTransform(
                    scaleX: 64/distance(translation: translation),
                    y: 64/distance(translation: translation)))
        }
        return translation
    }
    
    func distance(translation: CGSize) -> Double {
        return sqrt(translation.width.magnitudeSquared + translation.height.magnitudeSquared)
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "circle")
                .scaleEffect(3)
                .frame(width: 300, height: 300)
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
                            offset = normalized(translation: value.translation)
                        }
                        .onEnded { value in
                            offset = CGSize.zero
                        }
                )
        }
    }
}

#Preview {
    JoystickController()
}

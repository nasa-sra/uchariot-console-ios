//
//  SummonView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/23/25.
//

import SwiftUI

struct SummonView: View {
    @State private var latitude = "0.0"
    @State private var longitude = "0.0"
    @FocusState.Binding var focusState: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Target Latitude:")
                    .bold()
                
                TextField("Latitude", text: $latitude)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusState)
            }
            HStack {
                Text("Target Longitude:")
                    .bold()
                
                TextField("Longitude", text: $longitude)
                    .keyboardType(.numbersAndPunctuation)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusState)
            }
            Button {
                
            } label: {
                ZStack {
                    Color.accent
                    
                    Text("SUMMON")
                        .foregroundStyle(.white)
                        .bold()
                        .frame(width: 100)
                }
                .frame(height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding([.horizontal, .bottom])
    }
}

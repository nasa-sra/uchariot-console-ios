//
//  StatusView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/19/25.
//

import SwiftUI

struct StatusView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Hello, World!")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.body)
                                .fontWeight(.semibold)
                                .padding(0)
                            Text("Disconnect")
                        }
                    }
                }
            }
    }
}

#Preview {
    StatusView()
}

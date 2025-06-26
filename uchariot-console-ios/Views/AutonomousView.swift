//
//  AutonomousView.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/22/25.
//

import SwiftUI
import MapKit

struct AutonomousView: View {
    let locationManager = CLLocationManager()
    @Binding var robotState: NavigationView.RobotState
    @State var autonomousModeSelected: AutonomousMode = .pathing
    @FocusState var isFocused: Bool
    
    enum AutonomousMode: String, CaseIterable, Identifiable {
        case pathing, following, summon
        var id: Self { self }
    }
    
    var body: some View {
        VStack {
            Picker("Autonomous Mode", selection: $autonomousModeSelected) {
                ForEach(AutonomousMode.allCases) { mode in
                    Text(mode.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            .padding([.horizontal, .top])
            
            if !isFocused {
                Map {
                    Annotation("µchariot", coordinate: CLLocationCoordinate2D(latitude: 29.56006, longitude: -95.084609)) {
                        Image(systemName: "tire")
                            .foregroundStyle(.white)
                            .frame(width: 20, height: 20)
                            .padding(7)
                            .background(.accent.gradient, in: .circle)
                    }
                }
                .mapStyle(.hybrid)
                .mapControls() {
                    MapCompass()
                    MapScaleView()
                }
                .onAppear() {
                    locationManager.requestWhenInUseAuthorization()
                }
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding([.horizontal])
            }
            
            Spacer()
            
            switch autonomousModeSelected {
            case .pathing:
                PathingView(focusState: $isFocused)
            case .following:
                FollowingView()
            case .summon:
                SummonView(focusState: $isFocused)
            }
        }
        .onAppear {
            if robotState == .enabled {
                robotState = .disabled
            }
        }
        .onChange(of: autonomousModeSelected) {
            if robotState == .enabled {
                robotState = .disabled
            }
        }
    }
}

#Preview {
    AutonomousView(robotState: .constant(.disabled))
}

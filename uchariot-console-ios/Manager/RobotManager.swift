//
//  RobotManager.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/24/25.
//

import Foundation

@MainActor
class RobotManager: ObservableObject {
    @Published var isConnected = false  // ✅ Reactive connection status

    private let ssh: SSHConnection
    private let unix: UnixConnection

    init() {
        ssh = SSHConnection()
        unix = UnixConnection()
    }

    func connect(ip: String) async {
        unix.connect(host: ip, port: 8000)
        await ssh.connect(host: ip)
        isConnected = unix.connected && ssh.connected  // ✅ Update state
    }

    func disconnect() async {
        unix.disable()
        isConnected = false  // ✅ Reset on disconnect
        LogManager.clear()
    }
    
    func enable() {
        unix.enable()
        LogManager.log("Enabling")
    }
    
    func disable(_ estopped: Bool = false) {
        unix.disable()
        LogManager.log(estopped ? "E-Stopping" : "Disabling")
    }
    
    func drive(velocity: Double, rotation: Double) {
        let data = ["velocity": velocity, "rotation": rotation]
        unix.sendCommand(cmdName: "teleop_drive", data: data)
    }
}

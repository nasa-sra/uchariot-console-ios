//
//  RobotManager.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/24/25.
//

import Foundation

@MainActor
class RobotManager: ObservableObject {
    private let ssh: SSHConnection
    private let unix: UnixConnection
    
    init() {
        ssh = SSHConnection()
        unix = UnixConnection()
    }
    
    func connect(ip: String) async {
        unix.connect(host: ip, port: 8000)
        await ssh.connect(host: ip)
    }
    
    func disconnect() async {
        unix.disable()
    }
    
    func isConnected() -> Bool {
        return unix.connected && ssh.connected
    }
}

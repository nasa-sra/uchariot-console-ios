//
//  SSHConnection.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/25/25.
//

import Foundation
import Citadel
import SwiftUI

let USERNAME = "uchariot"
let PASSWORD = "123456"

class SSHConnection {
    var client: SSHClient? = nil
    var sftp: SFTPClient? = nil
    
    func connect(host: String) async {
        if client != nil { return }
        
        let creds = SSHClientSettings(
            host: host,
            authenticationMethod: { .passwordBased(username: USERNAME, password: PASSWORD) },
            hostKeyValidator: .acceptAnything()
        )
        do {
            LogManager.log("Connecting SSH to \(host)")
            client = try await SSHClient.connect(to: creds)
            LogManager.log("Connected SSH to \(host)")
        } catch {
            LogManager.log("Failed SSH connection with \(host)")
        }
    }
    
    func sendCommand(command: String) async {
        do {
            let _ = try await client!.executeCommand("sudo -S -p '' \(command)")
            LogManager.log("Sent SSH command \(command)")
        } catch {
            LogManager.log("Failed SSH command \(command)")
        }
    }
    
    func close() async {
        do {
            try await sftp?.close()
            try await client?.close()
            sftp = nil
            client = nil
        } catch {
            
        }
        LogManager.log("Disconnected SSH")
    }
}

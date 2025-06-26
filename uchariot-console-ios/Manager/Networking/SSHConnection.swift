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
    var connected = false
    
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
            if client!.isConnected {
                connected = true
                LogManager.log("Connected SSH to \(host)")
            }
        } catch {
            Task {
                await close()
            }
            LogManager.log("Failed SSH connection with \(host)")
        }
    }
    
    func sendCommand(command: String) async {
        if connected {
            do {
                let _ = try await client!.executeCommand("sudo -S -p '' \(command)")
                LogManager.log("Sent SSH command \(command)")
            } catch {
                LogManager.log("Failed SSH command \(command)")
            }
        } else {
            LogManager.log("Failed SSH command, not connected!")
        }
    }
    
    func close() async {
        do {
            try await sftp?.close()
            try await client?.close()
        } catch {
            
        }
        sftp = nil
        client = nil
        connected = false
        LogManager.log("Disconnected SSH")
    }
}

//
//  SSHConnection.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/25/25.
//

import Foundation
import Citadel

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
            client = try await SSHClient.connect(to: creds)
        } catch {
            
        }
    }
    
    func sendCommand(command: String) async {
        do {
            let stdout = try await client!.executeCommand("sudo -S -p '' \(command)")
        } catch {
            
        }
    }
    
    func close() async {
        do {
            try await sftp?.close()
            try await client?.close()
        } catch {
            
        }
    }
}

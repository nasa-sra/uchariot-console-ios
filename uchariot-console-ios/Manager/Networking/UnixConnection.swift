//
//  UnixConnection.swift
//  uchariot-console-ios
//
//  Created by Davey Adams on 6/24/25.
//

import Foundation
import SocketIO
import SwiftUI

class UnixConnection {
    var manager: SocketManager? = nil
    var socket: SocketIOClient? = nil
    var connecting = false
    var running = true
    var connected = false
    var lastHeatbeatTime = 0
    var connectCallback: ((Bool) -> ())? = nil
    var packetCallback: (([Any]) -> ())? = nil
    
    func connect(host: String, port: Int, completion: ((Bool) -> ())? = nil) {
        if !connecting {
            self.connecting = true
            LogManager.log("Connecting to \(host):\(port)")
            Task {
                self.manager = SocketManager(socketURL: URL(string: "http://\(host):\(port)")!)
                self.socket = manager!.defaultSocket
                self.socket!.connect(timeoutAfter: 3.0, withHandler: nil)
                self.socket!.on(clientEvent: .connect) { data, ack in
                    LogManager.log("Connected to \(host):\(port)")
                    self.connected = true
                }
                
                Task {
                    recieve()
                }
                
                self.connecting = false
                self.setController("disabled")
                
                if completion != nil {
                    self.connectCallback = completion
                    completion!(connected)
                }
            }
        }
    }
    
    func recieve() {
        self.socket!.on("message") { data, ack in
            self.lastHeatbeatTime = Int(NSDate().timeIntervalSince1970)
            if !self.connected {
                self.connected = true
                if self.connectCallback != nil {
                    self.connectCallback!(true)
                }
            }
            
            if self.packetCallback != nil {
                self.packetCallback!(data)
            }
            
            if Int(NSDate().timeIntervalSince1970) - self.lastHeatbeatTime > 500 {
                LogManager.log("Disconnected from host")
                self.connected = false
                self.connectCallback!(false)
            }
        }
    }
    
    func addPacketCallback(callback: @escaping ([Any]) -> ()) {
        self.packetCallback = callback
    }
    
    func sendCommand(cmdName: String, data: SocketData) {
        if self.connected {
            self.socket!.emit(cmdName, data)
        }
    }
    
    func setController(_ ctr: String) {
        if self.connected {
            let data = ["name": ctr]
            self.sendCommand(cmdName: "set_controller", data: data)
        }
    }
    
    func enable() {
        self.sendCommand(cmdName: "enable", data: [])
    }
    
    func disable() {
        self.sendCommand(cmdName: "disable", data: [])
    }
    
    func disconnect() {
        self.manager?.disconnect()
        LogManager.log("Disconnected")
    }
}

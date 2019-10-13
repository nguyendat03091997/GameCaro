//
//  WebSocket.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import SocketIO
import Starscream

let webSocket = WebSocket.shareInstance()
class WebSocket{
    static var instance: WebSocket!
    class func shareInstance() ->WebSocket{
        if(instance == nil){
            return WebSocket()
        }
        return instance
    }
    
    var manager : SocketManager!
    var socket : SocketIOClient!
    
    init() {
        self.manager = SocketManager.init(socketURL: URL(string: "http://localhost:3001")!, config: [.log(true),.compress])
        self.socket = manager.defaultSocket
    }
    
    func connect() {
        socket.connect()
        socket.on(clientEvent: .connect) { (data, _) in
            print("connected to server")
        }
    }
    
    func disConnect() {
        socket.disconnect()
    }
    
    func on(header : String, handle: @escaping ((Any)->Void)) {
        if(socket == nil){
            return
        }
        
        socket.on(header) { (data, ack) in
            handle(data)
        }
        
    }
    
    func emit(header: String, data: NSDictionary, handle: (()->Void)? = nil) {
        if(socket == nil){
            return
        }
        
        socket.emit(header, data) {
            if(handle == nil){
                return
            }
            handle!()
        }

    }
    
    
    
}

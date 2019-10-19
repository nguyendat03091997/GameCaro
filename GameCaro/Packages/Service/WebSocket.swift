//
//  WebSocket.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import Starscream


let webSocket = WSocket.shareInstance()
class WSocket : NSObject, WebSocketDelegate{
    
    static var instance: WSocket!
    class func shareInstance() ->WSocket{
        if(instance == nil){
            return WSocket()
        }
        return instance
    }
    
    var socket: WebSocket!
    
    func connect() {
        socket = WebSocket(url: URL(string: "http://localhost:3001")!)
        socket.delegate = self
        socket.connect()
        socket.onConnect = {
            let dataAuthen: Dictionary = [
                "header": Header.authenticated.rawValue,
                "token" : accountDataManager.tokenID
            ]
            dataAuthen.printJson()
            self.socket.write(string: dataAuthen.jsonString)
        }
        
    }
    
    func emit(header: Header, data: NSDictionary, handle: (()->Void)? = nil){
        let dataSending: [String:Any] = [
            "header" : header.rawValue,
            "data" : data
        ]
        print(dataSending.jsonString)
        socket.write(string: dataSending.jsonString){
            if(handle != nil){
                handle!()
            }
        }
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("connected to server !")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("websocketDidReceiveMessage")
        print(text)

        let dataResponse = text.toJSON()! as! [String:Any]
        let header = Header.init(rawValue: (dataResponse["header"] as! String)) ?? .authenticated
        
        switch header {
        case .create_room:
            notifyInstance.post(.create_room, dataResponse["data"] as! [String:Any])
        case .join_room:
            notifyInstance.post(.join_room, dataResponse["data"] as! [String:Any])
            //print("join room \(dataResponse["data"])")
        case .play_game:
            notifyInstance.post(.play_game, dataResponse["data"] as! [String:Any])
            //print("play game \(dataResponse["data"])")
        case .game_result:
            notifyInstance.post(.game_result, dataResponse["data"] as! [String:Any])
            //print("game result \(dataResponse["data"])")
        case .chat:
            print("chat \(dataResponse["data"])")
        default:
            break
        }
        
//        join room Optional({
//            "bet_point" = 2;
//            "create_time" = "2019-10-16T17:30:23+07:00";
//            guest = thedat;
//            "guest_id" = 5d900dc4f2e4e50da8f98e06;
//            "guest_socket" = 5da6f13913301d0444e16f30;
//            host = thedat2;
        //            "host_socket" = 5da6f12813301d0444e16f2f;
//            "host_id" = 5da6f05c13301d0444e16f2b;
//            id = 4;
//            "is_played" = 1;
//        })
        
        
        
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocketDidReceiveData")
        print(data)
    }
    
   
    
    
    
}

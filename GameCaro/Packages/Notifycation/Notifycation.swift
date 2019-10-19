//
//  Notifycation.swift
//  GameCaro
//
//  Created by Mojave on 10/15/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

enum NotifyType: String {
    case create_room    = "create_room"
    case join_room      = "join_room"
    case play_game      = "play_game"
    case game_result    = "game_result"
}


let notifyInstance = Notify.shareInstance()
class Notify: NSObject{
    static var instance : Notify!
    class func shareInstance() ->Notify{
        if(instance == nil){
            return Notify()
        }
        return instance
    }
    
    
    func add(_ target: Any, _ selector: Selector, _ type: NotifyType) {
        NotificationCenter.default.addObserver(target, selector: selector, name: Notification.Name(rawValue: type.rawValue), object: nil)
    }
    
    func remove(_ target: Any, _ type: NotifyType) {
        NotificationCenter.default.removeObserver(target, name: Notification.Name(rawValue: type.rawValue), object: nil)
    }
    
    func post(_ type: NotifyType, _ data: [String:Any]) {
        print(data)
        NotificationCenter.default.post(name: Notification.Name(rawValue: type.rawValue), object: nil, userInfo: data)
    }
    
    func post(_ type: NotifyType) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: type.rawValue), object: nil)
    }
    
    
}

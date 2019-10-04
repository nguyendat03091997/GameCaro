//
//  AccountDataManager.swift
//  GameCaro
//
//  Created by Mojave on 10/2/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation

let accountDataManager = AccountDataManager.shareInstance()
class AccountDataManager {
    static var instance : AccountDataManager!
    var userInfor : User!
    var tokenID = ""
    
    class func shareInstance() ->AccountDataManager{
        if(instance == nil){
            return AccountDataManager()
        }
        return instance
    }
    
    
}

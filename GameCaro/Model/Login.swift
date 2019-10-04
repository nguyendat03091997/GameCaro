//
//  Login.swift
//  GameCaro
//
//  Created by Mojave on 10/2/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
class Login_Request : MI{
    @objc dynamic var username = ""
    @objc dynamic var password = ""
}

class User : MI{
    @objc dynamic var username = ""
    @objc dynamic var win_game = 0
    @objc dynamic var total_game = 0
    @objc dynamic var point = 0
}

extension Service{
    class func loginProcess(request: Login_Request, success: @escaping ((User)->Void), failure: @escaping ((String)->Void)){
        
        service.requestAPI(apiFunc: APIFunc.login, params: request, success: { (response) in
            if let arrDict = response.data as? NSDictionary{
                success(User.init(dictionary: arrDict.value(forKey: "user") as! NSDictionary))
                return
            }
            success(User())
            
        }) { (error) in
            failure(error)
        }
        
    }
}

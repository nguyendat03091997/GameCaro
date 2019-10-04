//
//  Register.swift
//  GameCaro
//
//  Created by Mojave on 10/3/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
class Register_Request: Login_Request{
    
}

class Register_DTO: User {
    
}

extension Service{
    class func registerProcess(request: Register_Request, success: @escaping ((Register_DTO)->Void), failure: @escaping ((String)->Void)){
        
        service.requestAPI(apiFunc: .register, params: request, success: { (response) in
            
            if let arrDict = response.data as? NSDictionary{
                success(Register_DTO.init(dictionary: arrDict.value(forKey: "user") as! NSDictionary))
                return
            }
            success(Register_DTO())
            
        }) { (error) in
            failure(error)
        }
    }
}

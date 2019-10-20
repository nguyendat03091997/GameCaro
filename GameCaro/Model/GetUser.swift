//
//  GetUser.swift
//  GameCaro
//
//  Created by Mojave on 10/20/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation

extension Service{
    class func getUser(success: @escaping ((User)->Void), failure: @escaping ((String)->Void) ){
     
        service.getDataAPI(apiFunc: .user, success: { (response) in
            if(response.data == nil){
                success(User())
                return
            }
            
            let dataDict = response.data as! NSDictionary
            success(User.init(dictionary: dataDict))
            
        }) { (error) in
            failure(error)
        }
        
    }
}

//
//  AllRoom.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation

class AllRoom_Request : MI{
    @objc dynamic var token = ""
    @objc dynamic var user_id = ""
}

class AllRoom_DTO: MI {
    @objc dynamic var id = ""
    @objc dynamic var host = ""
    @objc dynamic var host_id = ""
    @objc dynamic var host_socket = ""
    @objc dynamic var bet_point = ""
    @objc dynamic var is_played = ""
    @objc dynamic var create_time = ""
    
    
    class func list(_ data: [NSDictionary]) ->[AllRoom_DTO]{
        var result = [AllRoom_DTO]()
        for item in data {
            result.append(AllRoom_DTO.init(dictionary: item))
        }
        return result
    }
    
}

extension Service{
    class func getAllRoom(success: @escaping (([AllRoom_DTO])->Void), failure: @escaping ((String)->Void)){
        
        service.getDataAPI(apiFunc: .allroom, success: { (response) in
            
            if(response.data == nil){
                success([])
                return
            }
            
            let arrDict = response.data as! [NSDictionary]
            success(AllRoom_DTO.list(arrDict))
            
        }) { (error) in
            failure(error)
        }
        
    }
}

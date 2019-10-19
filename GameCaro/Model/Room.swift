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

class Room_DTO: MI {
    @objc dynamic var id = 0
    @objc dynamic var host = ""
    @objc dynamic var host_id = ""
    @objc dynamic var host_socket = ""
    @objc dynamic var bet_point = 0
    @objc dynamic var is_played = ""
    @objc dynamic var create_time = ""
    
    
    class func list(_ data: [NSDictionary]) ->[Room_DTO]{
        var result = [Room_DTO]()
        for item in data {
            result.append(Room_DTO.init(dictionary: item))
        }
        return result
    }
    
}

extension Service{
    class func getAllRoom(success: @escaping (([Room_DTO])->Void), failure: @escaping ((String)->Void)){
        
        service.getDataAPI(apiFunc: .allroom, success: { (response) in
            
            if(response.data == nil){
                success([])
                return
            }
            
            let arrDict = response.data as! [NSDictionary]
            success(Room_DTO.list(arrDict))
            
        }) { (error) in
            failure(error)
        }
        
    }
}

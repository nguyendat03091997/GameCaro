//
//  Rank.swift
//  GameCaro
//
//  Created by Mojave on 10/13/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation

class Rank_DTO : MI{
    @objc dynamic var username = ""
    @objc dynamic var point = 0
    
    class func list(_ data: [NSDictionary]) ->[Rank_DTO]{
        var result = [Rank_DTO]()
        for item in data {
            result.append(Rank_DTO.init(dictionary: item))
        }
        return result
    }
}

extension Service{
    class func getRank(success: @escaping (([Rank_DTO])->Void), failure: @escaping ((String)->Void)){
        
        service.getDataAPI(apiFunc: .rank, success: { (response) in
        
            if(response.data == nil){
                success([])
                return
            }
            let arrDict = response.data as! [NSDictionary]
            success(Rank_DTO.list(arrDict))
            
        }) { (errorResponse) in
            failure(errorResponse)
        }
        
    }
}

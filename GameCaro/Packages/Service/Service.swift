//
//  Service.swift
//  GameCaro
//
//  Created by Mojave on 9/30/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import Alamofire

let service = Service.shareInstance()
class Service{
    static var instance: Service!
    let url: String = "http://localhost:3001"
    class func shareInstance() ->Service{
        if(instance == nil){
            return Service()
        }
        return instance
    }
    
    func requestAPI(apiFunc: APIFunc, params: MI, success: @escaping ((ITAPIResponse)->Void), failure: @escaping ((String)->Void)){
        let url = self.url + apiFunc.rawValue
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Accept" : "application/json"
        ]
        
        let paramsRequest = self.requestParameter(params.dictionary())
        
        self.requestAlamofire(url: url, method: .post, params: paramsRequest, encoding: JSONEncoding.default, headers: header).responseJSON { (data) in
            
            let response = self.processResponse(response: data)

            if(data.response?.statusCode == 200){ // OK
                self.setConfigUser(response: response, api: apiFunc)
                success(response)
            }else{
                let data = response.data as! NSDictionary
                let errorResponse = data.value(forKey: "error_message") as! String
                failure(errorResponse)
            }
            
        }
        
        
    }
    
    func getDataAPI(apiFunc: APIFunc, success: @escaping ((ITAPIResponse)->Void), failure: @escaping ((String)->Void)) {
        let url = self.url + apiFunc.rawValue
        
        getAlamofire(url: url).responseJSON { (data) in
            let response = self.processResponse(response: data)

            if(data.response?.statusCode == 200){ // OK
                success(response)
            }else{
                let data = response.data as! NSDictionary
                let errorResponse = data.value(forKey: "error_message") as! String
                failure(errorResponse)
            }
        }
        
    }
    
    func requestAlamofire(url: String, method: HTTPMethod, params: Parameters, encoding: ParameterEncoding, headers: HTTPHeaders) -> DataRequest {
        return Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
    }
    
    func getAlamofire(url: String) -> DataRequest {
        return Alamofire.request(url)
    }
    
    
}

extension Service{
    func requestParameter(_ dict: Dictionary<String,Any>) -> Parameters {
        var result : Parameters = [:]
        
        for (k,v) in dict {
            result[k] = v
        }
        return result
    }
    
    func processResponse(response: DataResponse<Any>) -> ITAPIResponse {
        if(response.result.isSuccess){
                let tempDict : Dictionary<String,Any> = ["data" : response.result.value as Any]
                return ITAPIResponse.init(dictionary: tempDict as NSDictionary)

            }
        return ITAPIResponse.init()
    }
    
    func setConfigUser(response : ITAPIResponse, api : APIFunc) {
        if(api == .login){
            if let arrDict = response.data as? NSDictionary{
                let user: User = User.init(dictionary: arrDict.value(forKey: "user") as! NSDictionary)
                accountDataManager.userInfor = user
                accountDataManager.tokenID = arrDict.value(forKey: "token") as! String
            }
            
        }
    }
}

//
//  Extension + Dictionary.swift
//  GameCaro
//
//  Created by Mojave on 10/13/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation

extension Dictionary{
    var jsonString: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJson() {
        print(jsonString)
    }
}

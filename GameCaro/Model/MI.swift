//
//  MI.swift
//  GameCaro
//
//  Created by Mojave on 10/2/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

open class MI: NSObject {
    
    private static let RESPONSES = "responses"
    
    required public override init() {
        super.init()
    }
    
    public init(dictionary : NSDictionary)
    {
        super.init()
        var allKey = self.getPropertyNames(mirror: nil)
        var allkeyUpper : [String] = []
        
        for item in allKey
        {
            allkeyUpper.append(item.uppercased())
        }
        
        let dictionaryUpper : NSMutableDictionary = NSMutableDictionary()
        
        for item in dictionary.allKeys
        {
            dictionaryUpper.setValue(dictionary.value(forKey: item as! String), forKey: (item as! String).uppercased() )
        }
        
        
        for  i in 0..<allKey.count
        {
            let key = allKey[i]
            
            
            if(dictionaryUpper[key.uppercased()] != nil )
            {
                if var value = dictionaryUpper[key.uppercased()]
                {
                    if(!(value  is NSNull))
                    {
                        if(value is String)
                        {
                            if((value as! String) == "<null>")
                            {
                                value = ""
                            }
                        }
                        
                        
                        
                        self.setValue(value , forKey: key )
                    }
                }
            }
        }
    }
    
    func getClassName(_ className: String) -> String {
        return "\(Bundle.main.infoDictionary!["CFBundleExecutable"] as! String).\(className)"
    }
    
    func getPropertyClassFromClassName(_ className: String) -> MI.Type
    {
        let anyobjectype : AnyObject.Type = NSClassFromString(className)!
        let nsobjectype : MI.Type = anyobjectype as! MI.Type
        return nsobjectype
    }
    
    func getPropertyClassFromName(_ name: String) -> MI? {
        if let className = getPropertyTypeStringOfName(name) {
            return getPropertyClassFromClassName(className).init()
        }
        return nil
    }
    
    func getPropertyTypeStringOfName(_ name: String) -> String? {
        for child in Mirror(reflecting:self).children {
            if child.label! == name {
                return getClassName(String(describing: type(of: child.value)))
            }
        }
        return nil
    }
    
    public func getPropertyNames(mirror: Mirror?) -> [String] {
        var result = [String]()
        let type = mirror ?? Mirror(reflecting: self)
        result.append(contentsOf: type.children.compactMap { $0.label })
        if let parent = type.superclassMirror {
            result.append(contentsOf: getPropertyNames(mirror: parent))
        }
        return result
    }
    
    public func propertyNamesOriginal() -> [String] {
        return Mirror(reflecting: self).children.compactMap{ $0.label }
    }
    
    public func dictionary() ->Dictionary<String,Any> {
        var dict = Dictionary<String, Any>()
        let allKey = getPropertyNames(mirror: nil)
        for  i in 0..<allKey.count
        {
            dict[allKey[i]] = value(forKey: allKey[i])
        }
        return dict
    }
    
}

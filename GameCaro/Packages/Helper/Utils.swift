//
//  Utils.swift
//  GameCaro
//
//  Created by Mojave on 10/4/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    class func drawRimView(view: UIView,radius: CGFloat){
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
    class func createImage(name: String) ->UIImage{
        return UIImage.init(named: name)?.withRenderingMode(.alwaysOriginal) ?? UIImage()
    }
    
    class func formatData(_ data: String) ->String{
        let temp = data.replacingOccurrences(of: "T", with: " ")
        return String(temp.prefix(19))
    }
}

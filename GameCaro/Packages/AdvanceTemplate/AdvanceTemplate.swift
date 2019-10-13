//
//  AdvanceTemplate.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

let template = AdvanceTemplate.shareInstance()
class AdvanceTemplate{
    static var instance: AdvanceTemplate!
    class func shareInstance() ->AdvanceTemplate{
        if(instance == nil){
            return AdvanceTemplate()
        }
        return instance
    }
    
    let primaryColor = UIColor(red:0.05, green:0.66, blue:0.80, alpha:1.0)
}

class SkyButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private var title: String = ""
    @IBInspectable var setTitle: String{
        set{
            title = newValue
            self.setTitle(title, for: .normal)
        }
        get{
            return title
        }
    }
    
    func setTextColor(color : UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    func setBackGroundColor(color : UIColor) {
        self.backgroundColor = color
    }

}

class ButtonDefault: SkyButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTextColor(color: .white)
        self.setBackGroundColor(color: .gray)
    }
}

class ButtonPrimary: SkyButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTextColor(color: .white)
        self.setBackGroundColor(color: template.primaryColor)
    }
}

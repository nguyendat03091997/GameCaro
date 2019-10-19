//
//  ProfileView.swift
//  GameCaro
//
//  Created by Mojave on 10/13/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class ProfileView: SkyView {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbValue: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    override func initStyle() {
        Utils.drawRimView(view: mainView, radius: 12)
    }
    
    @IBInspectable var title: String{
        set{
            lbTitle.text = newValue
        }
        get{
            return lbTitle.text ?? ""
        }
    }
    
    var value: String{
        set{
            lbValue.text = newValue
        }
        get{
            return lbValue.text ?? ""
        }
    }
    

}

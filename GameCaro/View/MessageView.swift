//
//  MessageView.swift
//  GameCaro
//
//  Created by Mojave on 10/19/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class MessageView: SkyView {
    
    @IBOutlet weak var lbContent: UILabel!

    override func initStyle() {
    
    }
    
    var  content: String{
        set{
            lbContent.text = newValue
        }
        get{
            return lbContent.text ?? ""
        }
    }
    
    

}

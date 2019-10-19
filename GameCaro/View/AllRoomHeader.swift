//
//  AllRoomHeader.swift
//  GameCaro
//
//  Created by Mojave on 10/14/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class AllRoomHeader: SkyView {

    @IBOutlet weak var lbTitle: UILabel!
    
    override func initStyle() {
        lbTitle.textColor = template.primaryColor
    }

}

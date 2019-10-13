//
//  AllRoomCell.swift
//  GameCaro
//
//  Created by Mojave on 10/9/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class AllRoomCell: UICollectionViewCell {

    @IBOutlet weak var lbRoomcode: UILabel!
    @IBOutlet weak var lbRoomCodeValue: UILabel!
    
    @IBOutlet weak var lbBetPoint: UILabel!
    @IBOutlet weak var lbBetPointValue: UILabel!
    
    @IBOutlet weak var lbCreatedTime: UILabel!
    @IBOutlet weak var lbCreatedTimeValue: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupView()
    }
    
    func setupView() {
        lbRoomcode.textColor = template.primaryColor
        lbRoomCodeValue.textColor = template.primaryColor
        lbBetPoint.textColor = template.primaryColor
        lbBetPointValue.textColor = template.primaryColor
        lbCreatedTime.textColor = template.primaryColor
        lbCreatedTimeValue.textColor = template.primaryColor
        
        Utils.drawRimView(view: cardView, radius: 12.0)
    }
    
    func setData(_ data: AllRoom_DTO) {
        lbRoomCodeValue.text = data.id
        lbBetPointValue.text = data.bet_point
        lbCreatedTimeValue.text = Utils.formatData(data.create_time)
    }

}

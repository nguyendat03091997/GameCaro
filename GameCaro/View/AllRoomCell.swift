//
//  AllRoomCell.swift
//  GameCaro
//
//  Created by Mojave on 10/14/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class AllRoomCell: UITableViewCell {
    
    @IBOutlet weak var lbSTT: UILabel!
    @IBOutlet weak var lbBetPoint: UILabel!
    @IBOutlet weak var lbCreateTime: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    var Room_DTO: Room_DTO!
    
    var handleJoinRoom : (Int)->(Void) = {_ in}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets.init(top: 5, left: 0, bottom: 5, right: 0))
        cardView.layer.cornerRadius = 8.0
    }
    
    func setData(_ data: Room_DTO, _ row: Int) {
        self.Room_DTO = data
        lbSTT.text = "Room " + row.description
        lbBetPoint.text = "Bet point : " + data.bet_point.description
        lbCreateTime.text = "Create time : " + Utils.formatData(data.create_time)
    }
    
    @IBAction func joinRoom(sender: UIButton){
        self.handleJoinRoom(self.Room_DTO!.id)
    }
    
}

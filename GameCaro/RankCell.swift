//
//  RankCell.swift
//  GameCaro
//
//  Created by Mojave on 10/13/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class RankCell: UITableViewCell {
    
    @IBOutlet weak var lbUserName : UILabel!
    @IBOutlet weak var lbPoint : UILabel!
    @IBOutlet weak var imageRank : UIImageView!
    @IBOutlet weak var imageAvatar : UIImageView!
    @IBOutlet weak var cardView : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0))
        cardView.layer.cornerRadius = 8.0
    }
    
    func setData(_ data: Rank_DTO, _ row : Int) {
        lbUserName.text = data.username
        lbPoint.text = data.point.description
        
        if(row % 2 == 0){
            imageAvatar.image = UIImage(named: "user")?.withRenderingMode(.alwaysOriginal)
        }else{
            imageAvatar.image = UIImage(named: "user1")?.withRenderingMode(.alwaysOriginal)
        }
        
        let number = row + 1
        let imageName: String = "rank" + number.description
        imageRank.image = UIImage(named: imageName)
        
    }
    
}

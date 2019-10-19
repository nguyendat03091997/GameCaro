//
//  PlayGameCell.swift
//  GameCaro
//
//  Created by Mojave on 10/16/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class PlayGameCell: UICollectionViewCell {
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var imageBox: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewContent.layer.borderWidth = 0.5
        viewContent.layer.borderColor = UIColor.darkGray.cgColor
        imageBox.isHidden = true
    }
    
    func setData(_ image: String) {
        viewContent.isHidden = true
        imageBox.isHidden = false
        imageBox.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
    }
    
}

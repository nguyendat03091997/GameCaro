//
//  ProfileViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class ProfileViewController: MasterViewController {
    
    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var imageAvatar: UIImageView!
    
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var viewWinGame: ProfileView!
    @IBOutlet weak var viewTotalGame: ProfileView!
    @IBOutlet weak var viewPoint: ProfileView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.loadData()
    }
    
    func setupView() {
        self.setNavigationTitle("Profile")
        imageAvatar.translatesAutoresizingMaskIntoConstraints = false
        imageAvatar.topAnchor.constraint(equalTo: imageCover.bottomAnchor, constant: -imageAvatar.frame.height * 0.65).isActive = true
    }
    
    func loadData() {
        lbUserName.text = accountDataManager.userInfor.username
        viewWinGame.value = accountDataManager.userInfor.win_game.description
        viewTotalGame.value = accountDataManager.userInfor.total_game.description
        viewPoint.value = accountDataManager.userInfor.point.description
    }
}

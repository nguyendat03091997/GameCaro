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
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadData()
    }
    
    func setupView() {
        self.setNavigationTitle("Profile")
        imageAvatar.translatesAutoresizingMaskIntoConstraints = false
        imageAvatar.topAnchor.constraint(equalTo: imageCover.bottomAnchor, constant: -imageAvatar.frame.height * 0.65).isActive = true
    }
    
    func loadData() {
        
        weak var weakself = self
        weakself?.view.showActivity()
        Service.getUser(success: { (response) in
            weakself?.view.hideActivity()
            
            weakself?.user = response
            weakself?.updateUI()
            
        }) { (error) in
            weakself?.view.hideActivity()
            weakself?.dialogError(error)
        }
        
    }
    
    func updateUI() {
        lbUserName.text = self.user.username
        viewWinGame.value = self.user.win_game.description
        viewTotalGame.value = self.user.total_game.description
        viewPoint.value = self.user.point.description
    }
}

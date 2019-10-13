//
//  ProfileViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class ProfileViewController: MasterViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    
    func setupView() {
        self.setNavigationTitle("Profile")
    }
}

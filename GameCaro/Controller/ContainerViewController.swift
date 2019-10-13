//
//  ContainerViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class ContainerViewController: MasterViewController {
    
    var mainTabBarView: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabView()
        self.hideNavigationBar()
    }
    
    func setupTabView() {
        mainTabBarView = UITabBarController()
        
        let allroomViewControler = AllRoomViewController()
        let rankViewController = RankViewController()
        let profileViewController = ProfileViewController()
        
        allroomViewControler.tabBarItem = UITabBarItem.init(title: "", image: Utils.createImage(name: "allroom"), selectedImage:  Utils.createImage(name: "allroomselected"))
        rankViewController.tabBarItem = UITabBarItem.init(title: "", image: Utils.createImage(name: "rank"), selectedImage:  Utils.createImage(name: "rankselected"))
        profileViewController.tabBarItem = UITabBarItem.init(title: "", image: Utils.createImage(name: "profile"), selectedImage:  Utils.createImage(name: "profileselected"))
        
        allroomViewControler.tabBarItem.tag = 1
        rankViewController.tabBarItem.tag = 2
        profileViewController.tabBarItem.tag = 3
        
        mainTabBarView.viewControllers = [UINavigationController(rootViewController: allroomViewControler),UINavigationController(rootViewController: rankViewController),UINavigationController(rootViewController: profileViewController)]
        mainTabBarView.selectedIndex = 0
        mainTabBarView.view.frame = self.view.frame
        
        self.view.addSubview(mainTabBarView.view)
        self.addChild(mainTabBarView)
        mainTabBarView.didMove(toParent: self)
    }
    
    
}

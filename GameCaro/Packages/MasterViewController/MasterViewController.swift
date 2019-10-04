//
//  MasterViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/4/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import  UIKit
class MasterViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    func setBackWithTitle(_ title: String) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backk")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLeftItem))
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.75, green:0.43, blue:0.43, alpha:1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    @objc func handleLeftItem(){
        self.pop()
    }
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

//
//  LoginViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/2/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class LoginViewController: MasterViewController {
    
    @IBOutlet weak var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupView()
    }
    
    func setupView() {
        self.hideNavigationBar()
    }

    
    @IBAction func loginTouched(sender: UIButton){
      
        let request = Login_Request()
        request.username = "thedat1"
        request.password = "key1234"
        self.view.showActivity()
        
        Service.loginProcess(request: request, success: { (response) in
            
            self.view.hideActivity()
            self.dialogSuccess("Login is success !")
            
        }) { (error) in
            self.view.hideActivity()
            self.dialogError(error)
        }
        
    }
    
    @IBAction func gotoRegister(sender: UIButton){
        let registerViewController = RegisterViewController()
        self.push(registerViewController)
    }


}
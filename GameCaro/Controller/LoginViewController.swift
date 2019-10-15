//
//  LoginViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/2/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit
import SocketIO

class LoginViewController: MasterViewController {
    
    @IBOutlet weak var btnLogin: UIButton!

    @IBOutlet weak var userNameView: EdittextController!
    
    @IBOutlet weak var passwordView: EdittextController!
    
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
    
    func loginSuccess() {
        let viewcontainer = ContainerViewController()
        self.present(viewcontainer, animated: true, completion: nil)
    }
  
    
    @IBAction func loginTouched(sender: UIButton){
      
        let validForm = validateLogin()
        if (!validForm.isValided) {
            return;
        }
        
        let request = Login_Request()
//        request.username = "thedat1"
//        request.password = "key1234"

        request.username = validForm.username
        request.password = validForm.password
        self.view.showActivity()
        
        Service.loginProcess(request: request, success: { (response) in
            
            self.view.hideActivity()
            self.dialogSuccess("Login is success !", implement: {
                self.loginSuccess()
            })
            
        }) { (error) in
            self.view.hideActivity()
            self.dialogError(error)
        }
        
    }
    
    @IBAction func gotoRegister(sender: UIButton){
        let registerViewController = RegisterViewController()
        self.push(registerViewController)
    }

    func validateLogin()-> (username:String,password:String, isValided: Bool){
        let username = userNameView.value
        let password = passwordView.value
        var isValided: Bool = true
        if (username.isEmpty){
            userNameView.errorText = "Username is required"
            isValided = false
        }
        if (password.isEmpty){
            passwordView.errorText = "Password is required"
            isValided = false
        }
        return (username, password, isValided)
        
    }

}

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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userNameView.edtInput.resignFirstResponder()
        passwordView.edtInput.resignFirstResponder()
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
            self.dialogInfor("Login is success !", implement: {
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
        let username = userNameView.value.trimmingCharacters(in: .whitespaces)
        let password = passwordView.value.trimmingCharacters(in: .whitespaces)
        var isValided: Bool = true
        if (username.isEmpty){
            userNameView.errorText = "Username is required"
            isValided = false
        } else {
            userNameView.errorText = ""
        }
        if (password.isEmpty){
            passwordView.errorText = "Password is required"
            isValided = false
        } else {
            passwordView.errorText = ""
        }
        return (username, password, isValided)
        
    }

}

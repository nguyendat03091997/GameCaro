//
//  RegisterViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/2/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class RegisterViewController: MasterViewController {

    @IBOutlet weak var btnRegister: UIButton!
    
    @IBOutlet weak var userNameView: EdittextController!
    
    @IBOutlet weak var passwordView: EdittextController!
    
    @IBOutlet weak var confirmView: EdittextController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    func setupView() {
        self.setBackWithTitle("Register")
    }
    
    
    @IBAction func registerTouched(sender: UIButton){
        let resultValidate = validateLogin();
        if (!resultValidate.isValided){
            return;
        }
        let request = Register_Request()

        NSLog(resultValidate.username)
        request.username = resultValidate.username
        request.password = resultValidate.password
        
        self.view.showActivity()
        Service.registerProcess(request: request, success: { (response) in
            
            self.view.hideActivity()
            self.dialogInfor("Register success"){
                self.pop()
            }
            
        }) { (error) in
            self.view.hideActivity()
            self.dialogError(error)
        }
        
        
    }

    func validateLogin()-> (username:String,password:String, isValided: Bool){
        let username = userNameView.value.trimmingCharacters(in: .whitespaces)
        let password = passwordView.value.trimmingCharacters(in: .whitespaces)
        let confirmPassword = confirmView.value.trimmingCharacters(in: .whitespaces)
        
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
        if (confirmPassword.isEmpty){
            confirmView.errorText = "Confirm password is required"
            isValided = false
        } else {
            if (confirmPassword != password){
                confirmView.errorText = "Confirm password isn't the same"
                isValided = false
            } else {
                confirmView.errorText = ""
            }
            
        }
        
        return (username, password, isValided)
        
    }

   

}

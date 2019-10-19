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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    func setupView() {
        self.setBackWithTitle("Register")
    }
    
    
    @IBAction func registerTouched(sender: UIButton){
        
        let request = Register_Request()
        request.username = "thedat2"
        request.password = "key1234"
        
        self.view.showActivity()
        Service.registerProcess(request: request, success: { (response) in
            
            self.view.hideActivity()
            self.dialogInfor("Register success")
            
        }) { (error) in
            self.view.hideActivity()
            self.dialogError(error)
        }
        
        
    }


   

}

//
//  PopupChatViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/19/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class PopupChatViewController: UIViewController {
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    
    var delegate: PlayGameViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.drawRimView(view: viewContent, radius: 8.0)
        Utils.drawRimView(view: btnSend, radius: 4.0)
        Utils.drawRimView(view: btnCancel, radius: 4.0)
        
        btnSend.backgroundColor = template.primaryColor

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tvMessage.resignFirstResponder()
    }

    
    @IBAction func sendTouched(sender: UIButton){
        if(tvMessage.text == ""){
            self.dialogInfor("Please enter your message !")
            return
        }
        
        self.delegate.handleMessage(tvMessage.text)
        self.removeView()
    }
    
    @IBAction func cancelTouched(sender: UIButton){
        self.removeView()
    }
    
    func removeView() {
        self.view.removeFromSuperview()
        self.removeFromParent()
    }


}

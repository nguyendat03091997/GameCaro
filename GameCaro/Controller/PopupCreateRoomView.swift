//
//  PopupCreateRoomView.swift
//  GameCaro
//
//  Created by Mojave on 10/14/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class PopupCreateRoomView: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var topViewTitle: UIView!
    @IBOutlet weak var tfBetPoint: UITextField!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupiew()
    }
    
    func setupiew() {
        topViewTitle.backgroundColor = template.primaryColor
        btnCreate.backgroundColor = template.primaryColor
        Utils.drawRimView(view: cardView, radius: 8.0)
        Utils.drawRimView(view: btnCreate, radius: 4.0)
        Utils.drawRimView(view: btnCancel, radius: 4.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfBetPoint.resignFirstResponder()
    }
    
    @IBAction func createTouched(sender : UIButton){
        let dataDict: NSDictionary = [
                    "token": accountDataManager.tokenID,
                    "host_id": accountDataManager.userInfor._id,
                    "host": accountDataManager.userInfor.username,
                    "bet_point": tfBetPoint.text!
                ]
        
        webSocket.emit(header: .create_room, data: dataDict) {
            let viewController = PlayGameViewController()
            viewController.isHost = true
            self.push(viewController)
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    @IBAction func cancelTouched(sender : UIButton){
        self.view.removeFromSuperview()
        self.removeFromParent()
    }


}

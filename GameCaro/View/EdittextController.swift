//
//  EdittextController.swift
//  GameCaro
//
//  Created by Hien Ho Developer on 10/13/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class EdittextController: SkyView {
    
    @IBOutlet weak var lbInput: UILabel!
    
    @IBOutlet weak var edtInput: UITextField!
        
    @IBOutlet weak var lbError: UILabel!
        
    @IBInspectable var labelText:String {
        set {
            lbInput.text = newValue
        }
        get {
            return lbInput.text ?? ""
        }
    }
    
    var value: String {
        set {
            edtInput.text = newValue
        }
        get {
            return edtInput.text ?? ""
        }
    }
    
    @IBInspectable var initValue: String {
        set {
            value = newValue
            edtInput.text = value
        }
        get {
            return edtInput.text ?? ""
        }
    }
    
    var isSecure: Bool = false
    
    @IBInspectable var isSecureInspect : Bool{
        set {
            isSecure = newValue
            edtInput.isSecureTextEntry = isSecure
        }
        get {
            return isSecure
        }
    }
    
    var errorText: String {
        set {
            lbError.text = newValue
        }
        
        get {
            return value
        }
    }
    
}

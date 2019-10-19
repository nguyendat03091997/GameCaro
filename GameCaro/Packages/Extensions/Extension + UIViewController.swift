//
//  Extension + UIViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/4/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func dialogInfor(_ infor: String) {
        let alertView = UIAlertController(title: "SUCCESS", message: infor, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
    func dialogError(_ error:String) {
        let alertView = UIAlertController(title: "ERROR", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
    func dialogInfor(_ infor: String, implement:@escaping (()->Void)) {
        let alertView = UIAlertController(title: "ANNOUNCE", message: infor, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { _ in
            implement()
        }
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
    func dialogError(_ error:String, implement:@escaping (()->Void)) {
        let alertView = UIAlertController(title: "ERROR", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { _ in
            implement()
        }
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
    func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }

}

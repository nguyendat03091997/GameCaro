//
//  Extension+UIView.swift
//  GameCaro
//
//  Created by Mojave on 10/3/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let HEIGHT_NAVIGATION = SCREEN_HEIGHT > 800 ? 84 : 64

extension UIView{
    
    func setFullLayout(_ view : UIView) // full layout for sub view
    {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0))
    }

    func showActivity() {
        DispatchQueue.main.async {
            let loadingView = UIView()
            loadingView.tag = 11111111
            let activityIndicate = UIActivityIndicatorView.init(style: .whiteLarge)
            
            //LoadingView
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            loadingView.backgroundColor = UIColor(red:0.28, green:0.25, blue:0.25, alpha:0.5)
            self.addSubview(loadingView)
            
            loadingView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
            loadingView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1, constant: CGFloat(HEIGHT_NAVIGATION)).isActive = true
            loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

            
            //ActivityIndicate
            activityIndicate.translatesAutoresizingMaskIntoConstraints = false
            loadingView.addSubview(activityIndicate)
            
            activityIndicate.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 0.2).isActive = true
            activityIndicate.heightAnchor.constraint(equalTo: activityIndicate.widthAnchor, multiplier: 1).isActive = true
            activityIndicate.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
            activityIndicate.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
            
            activityIndicate.color = UIColor.gray
            activityIndicate.backgroundColor = UIColor(red:0.30, green:0.27, blue:0.27, alpha:1.0)
            Utils.drawRimView(view: activityIndicate, radius: 8.0)

            activityIndicate.startAnimating()

        }

    }

    func hideActivity() {
        DispatchQueue.main.async {
            if let activityView = self.viewWithTag(11111111){
                activityView.removeFromSuperview()
            }
        }
    }
    

}

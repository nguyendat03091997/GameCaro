//
//  AdvanceTemplate.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation
import UIKit

let bundleName = "com.DatNguyen.GameCaro"
let ProjectBundle = Bundle.init(identifier: bundleName)!

let template = AdvanceTemplate.shareInstance()
class AdvanceTemplate{
    static var instance: AdvanceTemplate!
    class func shareInstance() ->AdvanceTemplate{
        if(instance == nil){
            return AdvanceTemplate()
        }
        return instance
    }
    
    let primaryColor = UIColor(red:0.05, green:0.66, blue:0.80, alpha:1.0)
}

open class SkyView: UIView {
    @IBOutlet open var view: UIView!
    func classNameAsString(_ obj: Any) -> String {
        return String(describing: type(of: (obj as AnyObject))).replacingOccurrences(of:"", with:".Type")
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        view.frame = bounds
        addSubview(view)
        self.setFullLayout(view)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        initStyle()
    }
    
    open func initStyle() {
        
    }
    
    open func loadViewFromNib() -> UIView {
        //let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName:self.classNameAsString(self), bundle: ProjectBundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        initStyle()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}




class SkyButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private var title: String = ""
    @IBInspectable var setTitle: String{
        set{
            title = newValue
            self.setTitle(title, for: .normal)
        }
        get{
            return title
        }
    }
    
    func setTextColor(color : UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    func setBackGroundColor(color : UIColor) {
        self.backgroundColor = color
    }

}

class ButtonDefault: SkyButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTextColor(color: .white)
        self.setBackGroundColor(color: .gray)
    }
}

class ButtonPrimary: SkyButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTextColor(color: .white)
        self.setBackGroundColor(color: template.primaryColor)
    }
}

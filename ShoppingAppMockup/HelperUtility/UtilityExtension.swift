//
//  UtilityExtension.swift
//  ShoppingAppMockup
//
//  Created by Gogoi on 18/06/2018.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    func appBG() -> UIColor {
        return UIColor(red: 235/255, green: 77/255, blue: 75/255, alpha: 1)
    }
    
    func textInputBG() -> UIColor {
        return UIColor(red: 235/255, green: 77/255, blue: 75/255, alpha: 0.5)
    }
}

extension UITextField {
    
    func makeItRound() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3).cgColor
        self.layer.backgroundColor  = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1).cgColor
        self.textAlignment = .center
    }
    
    func placeholderText(placeHolder: String){
        let attrText = NSAttributedString(string: "\(placeHolder)", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
    
//        self.setAttributedTitle(attrText, for: .normal)
    }
    
    
}

extension UIButton {
    
    func configureButton() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2).cgColor
        self.layer.backgroundColor  = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4).cgColor
     }
    
    func btnTitle(titleString: String){
        
        let attrText = NSAttributedString(string: "\(titleString)", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
        self.setAttributedTitle(attrText, for: .normal)
        
    }
}


extension UIView{
    

        func addConstraintWithFormat(formate: String, views: UIView...){
            
            var viewDiectionary = [String: UIView]()
            
            for (index, view) in views.enumerated(){
                let key = "v\(index)"
                viewDiectionary[key] = view
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, options: NSLayoutFormatOptions(), metrics: nil, views: viewDiectionary))
            
        }
    
    func onTapEffect(){
        
        DispatchQueue.main.async {
            
            let anim = CAKeyframeAnimation(keyPath: "transform.scale")
            anim.values = [0.9,0.8,1.1,1.0]
            anim.keyTimes = [0.1,0.3,0.6,0.9,1.2]
            anim.duration = 0.3
            self.layer.add(anim, forKey:"scale")
            
        }
    }
        
    
}


extension String{
    
    func isValidEmailId() ->Bool{
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        
        let result = emailTest.evaluate(with: self)
        
        return result
        
    }
    
}

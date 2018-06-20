//
//  LoginViewModel.swift
//  ShoppingAppMockup
//
//  Created by Gogoi on 18/06/2018.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import Foundation
import UIKit


enum AppError : Error {
    case invalidUserName
    case invalidPassword
    case invalidEmail
}

struct UserLogin  {

    var appAuth: String?
    var userName: String?
    var walletBalence: Double?
    
}

class LoginViewModel : NSObject {
    
    func validateUserInputs(txtUserName: UITextField?, txtPassword: UITextField?) throws {
        
        if let userName = txtUserName?.text{
            if !userName.isValidEmailId(){
                throw AppError.invalidEmail
            }
        }else{
            throw AppError.invalidUserName
        }
        
        if let password = txtPassword?.text{
            if password.count < 3{
                throw AppError.invalidPassword
            }
        }else{
            throw AppError.invalidPassword
        }
        
    }
    
     func performLoginAction(_ uid: String, _ pwd: String, handler: @escaping(_ loginResponse: UserLogin?) -> Void){
  
        let currentUserLogin = UserLogin(appAuth: "AXSGY458736587ghds", userName: "Some UserName", walletBalence: 19.0)
        
        handler(currentUserLogin)
        
    }
    
    
}

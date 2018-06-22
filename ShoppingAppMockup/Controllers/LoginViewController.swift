//
//  LoginViewController.swift
//  ShoppingAppMockup
//
//  Created by Gogoi on 18/06/2018.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit



class LoginViewController : UIViewController , UITextFieldDelegate{
    
    var loginViewModel : LoginViewModel!
    
    let txtUserName: UITextField = {
         let txt = UITextField()
         txt.makeItRound()
         txt.placeholder = "User Name"
         return txt
     }()
    
    let txtPassword: UITextField = {
        let txt = UITextField()
        txt.makeItRound()
        txt.isSecureTextEntry = true
        txt.placeholder = "Password"
        return txt
     }()
    
    let btnSignIn: UIButton = {
        let btn = UIButton()
        btn.configureButton()
        btn.btnTitle(titleString: "Login")
        return btn
    }()
    
    let imgLogo : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "mockLogo")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().appBG()
        loginViewModel = LoginViewModel()
        setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupView(){
        
        view.addSubview(imgLogo)
        view.addSubview(txtUserName)
        view.addSubview(txtPassword)
        view.addSubview(btnSignIn)
        txtUserName.delegate = self
        txtPassword.delegate = self
        
        view.addConstraintWithFormat(formate: "H:[v0(200)]", views: imgLogo)
        view.addConstraintWithFormat(formate: "H:|-50-[v0]-50-|", views: txtUserName)
        view.addConstraintWithFormat(formate: "H:|-50-[v0]-50-|", views: txtPassword)
        view.addConstraintWithFormat(formate: "H:|-50-[v0]-50-|", views: btnSignIn)
        view.addConstraintWithFormat(formate: "V:|-150-[v0(150)]-50-[v1(50)]-5-[v2(50)]-10-[v3(50)]", views: imgLogo,txtUserName,txtPassword,btnSignIn)
        
        view.addConstraint(NSLayoutConstraint.init(item: imgLogo, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        
        btnSignIn.addTarget(self, action: #selector(onTapLogin(_:)), for: .touchUpInside)
        txtPassword.addTarget(self, action: #selector(onTapTextFields(_:)), for: .editingDidBegin)
        txtUserName.addTarget(self, action: #selector(onTapTextFields(_:)), for: .editingDidBegin)

    }
    
    //MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtUserName {
            txtPassword.becomeFirstResponder()
            return false
        }
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //MARK: - OnTap Actions
    @objc func onTapTextFields(_ textField: UITextField){
        textField.onTapEffect()
    }
    
    
    @objc func onTapLogin(_ sender: UIButton){
       
        sender.onTapEffect()
        
        do {
            try loginViewModel.validateUserInputs(txtUserName: txtUserName, txtPassword: txtPassword)
        } catch AppError.invalidUserName {
            
            self.showAlert(title: "Login", msg: "Invalid User Name", ok: "OK", cancel: nil, onCancel: {
                
            }, onOk: {
                
            })
            
            return
        }catch AppError.invalidEmail{
            self.showAlert(title: "Login", msg: "Please provide a valid Email ID for User Name", ok: "OK", cancel: nil, onCancel: {
                
            }, onOk: {
                
            })
            return
        }catch AppError.invalidPassword{
            self.showAlert(title: "Login", msg: "Invalid Password", ok: "OK", cancel: nil, onCancel: {
                
            }, onOk: {
                
            })
            return
        }catch{
            print("catch other error")
        }
 
        loginViewModel.performLoginAction("uid", "pwd") { loginResponse in
            if let response = loginResponse{
                print("Login response \(response)")
                
                let homeVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
                self.navigationController?.pushViewController(homeVC, animated: true)
                
            }else{
                print("Login failed!")
            }
        }
 
    }
    
}


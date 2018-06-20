//
//  ShoppingAppMockupTests.swift
//  ShoppingAppMockupTests
//
//  Created by Gogoi on 20/06/2018.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import XCTest
@testable import ShoppingAppMockup

class ShoppingAppMockupTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
     }
    
    func testLoginModel() {
        let loginModel = LoginViewModel()

        //check all components on ViewController
        let loginVC = LoginViewController()
        _ = loginVC.view
        XCTAssertNotNil(loginVC.txtPassword)
        XCTAssertNotNil(loginVC.txtUserName)
        XCTAssertNotNil(loginVC.btnSignIn)
        XCTAssertNotNil(loginVC.imgLogo)
        XCTAssertNotNil(loginVC.imgLogo.image)
        
        //after login check expected credential
        let credential = UserLogin(appAuth: "ADGFSDG4857346jhdtegg", userName: "someName", walletBalence: 0.0)
        let validateResult = loginModel.validateLoginCredential(credential: credential)
        XCTAssertTrue(validateResult, "Login success credential expectation failed")
        
    }
    
    func testWebServices(){
        
        let webService = WebServicesAPI()
        XCTAssertNotNil(webService.baseURL)
        //check API URL rechability
        webService.performPostrequest(endPoint: "", dict: NSMutableDictionary()) { response in
            XCTAssertNotNil(response, "API Base Url is not reachable")
        }
 
    }
    
    
    
}

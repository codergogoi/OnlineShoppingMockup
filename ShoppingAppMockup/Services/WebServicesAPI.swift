
//
//  WebServicesAPI.swift
//  ShoppingAppMockup
//
//  Created by Gogoi on 20/06/2018.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import Foundation

class WebServicesAPI : NSObject {
    
    let baseURL = "http://jayantagogoi.com/api/online-shopping/"
    
    func performPostrequest(endPoint: String, dict: NSMutableDictionary, handler: @escaping(_ responseObject: Any?)->Void){
       
        let session = URLSession.shared
        
        let url: URL = URL(string: "\(baseURL)\(endPoint)")!
        
        let request = NSMutableURLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let postData = try! JSONSerialization.data(withJSONObject: dict, options: [])
        
        request.httpBody = postData
        
        let dataTask =  session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            guard error == nil && data != nil else{
                handler(nil)
                return
            }
            
            handler(response as Any)
            
        }
        
        dataTask.resume()
        
        
        handler("Error")
        
    }
    
}

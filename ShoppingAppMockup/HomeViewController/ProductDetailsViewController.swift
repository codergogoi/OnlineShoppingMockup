//
//  ProductDetailsViewController.swift
//  ShoppingAppMockup
//
//  Created by MAC01 on 28/03/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    var delegate: ProductDelegate?
    
    var dataModel: ProductDataModel?{
        
        didSet{
            if let product = dataModel{
                
                if let productName = product.itemName{
                    
                    productTitle.text = productName
                }
            }
        }
    }
    
    let productTitle: UILabel = {
        
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Product Details"
        view.backgroundColor = UIColor.white
        view.addSubview(productTitle)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": productTitle]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": productTitle]))
        
      }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

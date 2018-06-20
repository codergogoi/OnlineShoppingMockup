//
//  BaseCell.swift
//  ShoppingAppMockup
//
//  Created by MAC01 on 28/03/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

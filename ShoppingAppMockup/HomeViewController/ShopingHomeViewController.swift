//
//  ViewController.swift
//  ShoppingAppMockup
//
//  Created by MAC01 on 28/03/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class ShopingHomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let identifier = "cellId"
    let headerIdentifier = "headerCellId"
    let footerIdentifier = "footerCellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Product Home"
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: identifier)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        
    }
    
    func viewProductDetails(dataModel: ProductDataModel){
        
        let productDetailsVC = ProductPageViewController()
        productDetailsVC.dataModel = dataModel
        self.navigationController?.pushViewController(productDetailsVC, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader{
            
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as? HeaderCell{
                header.backgroundColor = .cyan
                header.homeViewController = self
                return header
                
            }
            
        }else {
            
            if let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier, for: indexPath) as? FooterCell{
                footer.backgroundColor = .green
                
                return footer
            }
            
        }
        
        return UICollectionViewCell()
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: view.frame.size.height/3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: (view.frame.size.height/3) - 68)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: view.frame.size.height/3)
    }
     

}


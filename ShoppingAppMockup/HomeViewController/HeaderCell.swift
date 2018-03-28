//
//  HeaderCell.swift
//  ShoppingAppMockup
//
//  Created by MAC01 on 28/03/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class HeaderCell: BaseCell {
    
    weak var homeViewController: ShopingHomeViewController?
    
    var pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    var pageControl = UIPageControl()
    var products: [ProductDataModel] = []
    
    
    override func setupViews() {
        super.setupViews()
        
        products.append(ProductDataModel(itemName: "Item 1", itemPrice: 1.0, itemDescription: "Some Description", itemURL: "some URL"))
        products.append(ProductDataModel(itemName: "Item 2", itemPrice: 2.0, itemDescription: "Some Description", itemURL: "some URL"))

        products.append(ProductDataModel(itemName: "Item 3", itemPrice: 3.0, itemDescription: "Some Description", itemURL: "some URL"))
        
       
        
        backgroundColor = .lightGray
        pageController.view.frame = self.frame
        pageController.dataSource = self
        pageController.delegate = self
        pageController.setViewControllers([viewControllerAtIndexPath(Index: 0)], direction: .forward, animated: true, completion: nil)
        
        
         self.addSubview(pageController.view)
        
        pageControl.frame = CGRect(x: 0, y: Int(self.bounds.maxY - 50), width: Int(self.frame.size.width), height: 50)
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.red
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.addSubview(pageControl)
        

    }
    
    func viewControllerAtIndexPath(Index: Int)-> UIViewController{
        
        let currentVC = ProductPageViewController()
        currentVC.dataModel = products[Index]
        currentVC.delegate = self
        currentVC.pageIndex = Index
        return currentVC
        
    }
    
    
}

extension HeaderCell : UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = 0
        
        if let currentVC = viewController as? ProductPageViewController{
            index = currentVC.pageIndex
        }
        
        if index == 0 || index == NSNotFound{
            return nil
        }
        
        index -= 1
         return viewControllerAtIndexPath(Index: index)
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = 0
        
        if let currentVC = viewController as? ProductPageViewController{
            index = currentVC.pageIndex
        }
        
        if index >= 2 || index == NSNotFound{
            return nil
        }
        
        index += 1
        return viewControllerAtIndexPath(Index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let pageContentViewController = pageViewController.viewControllers![0] as! ProductPageViewController
        self.pageControl.currentPage = pageContentViewController.pageIndex
    }
    
}

extension HeaderCell : ProductDelegate{
    
    func didTapOnProduct(dataModel: ProductDataModel) {
        self.homeViewController?.viewProductDetails(dataModel: dataModel)
    }
    
}



protocol ProductDelegate : class {
    
    func didTapOnProduct(dataModel: ProductDataModel)
    
}

class ProductPageViewController : UIViewController{
    
    var pageIndex : Int = 0
    
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
        
        view.backgroundColor = UIColor.white
        view.addSubview(productTitle)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": productTitle]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": productTitle]))
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnProduct))
        view.addGestureRecognizer(tapgesture)
    }
    
    @objc func didTapOnProduct(){
        
        if let product = self.dataModel{
            self.delegate?.didTapOnProduct(dataModel: product)
        }
    }
    
}



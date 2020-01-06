//
//  CarouselCollectionDataSource.swift
//  SnapCarouselDemo
//
//  Created by Prashant on 02/01/20.
//  Copyright © 2020 Prashant. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout


typealias rowSelected = (_ indexPath:IndexPath)->()

class CarouselCollectionDataSource:NSObject,UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    var width:CGFloat?
    var height:CGFloat?
    var item:[Any]?
    var clcView:UICollectionView?

    var cellConfig:ConfigRow?
    var selected:rowSelected?
    
    
    init(clcView:UICollectionView,width:CGFloat,height:CGFloat,item:[Any]) {
        
        super.init()
        self.width = width
        self.height = height
        self.item = item
        self.clcView = clcView
        setupLayout()
        self.clcView?.delegate = self
        self.clcView?.dataSource = self
        self.clcView?.reloadData()
        
        
    }
    
    fileprivate func setupLayout() {
        let layout = self.clcView?.collectionViewLayout as! UPCarouselFlowLayout
        layout.itemSize = CGSize(width:width ?? layout.itemSize.width, height: height ?? layout.itemSize.height)
        print(layout.itemSize)
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = clcView?.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) else { return UICollectionViewCell() }
        if let configCell = cellConfig{
            
           // configCell(cell)
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if  let selected = selected{
            
            selected(indexPath)
        }
    }
    
    
    
    

}

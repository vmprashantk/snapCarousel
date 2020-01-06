//
//  ViewController.swift
//  SnapCarouselDemo
//
//  Created by Prashant on 02/01/20.
//  Copyright © 2020 Prashant. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var clcView: UICollectionView!
    
    var clcDataSource:CarouselCollectionDataSource!
    var tblDataSourc:CustomTableDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()
    
       // clcView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        // Do any additional setup after loading the view.
       // setupLayout()
       // configClc()
        configTbl()
    }
    
    
    func configTbl(){
        
        tblDataSourc = CustomTableDataSource(tblView: tblView, row: 3,height:UIScreen.main.bounds.height * 0.4)
        
        tblDataSourc.cofigRow = { (cell) in
            
            if let cell = cell as? CustomTblCell{
                
               // cell.configClc()
            }
            
            
        }
    }
    
    func configClc(){
        
        clcDataSource = CarouselCollectionDataSource(clcView: clcView, width: self.view.frame.width*0.8, height: clcView.frame.height, item: ["1","2","3","4","5","6"])
        clcDataSource.selected = { (indexPath) in
            
            print(indexPath.row)
            
        }
    }
    
//    fileprivate func setupLayout() {
//        let layout = self.clcView.collectionViewLayout as! UPCarouselFlowLayout
//        layout.itemSize = CGSize(width: self.view.frame.width*0.8, height: clcView.frame.height)
//        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
//    }
//    override func viewWillAppear(_ animated: Bool) {
//
//        clcView.reloadData()
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = clcView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
//        return cell
//    }
    
    
   
    
    

}


//
//  CustomTblCell.swift
//  SnapCarouselDemo
//
//  Created by Prashant on 04/01/20.
//  Copyright © 2020 Prashant. All rights reserved.
//

import UIKit

class CustomTblCell: UITableViewCell {

    @IBOutlet weak var clcVew: UICollectionView!
    
    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    var clcDataSource:CarouselCollectionDataSource!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        clcVew.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")

       configClc()
    }
    
    func configClc(){
           

        clcDataSource = CarouselCollectionDataSource(clcView: clcVew, width: self.frame.width*0.7, height: (UIScreen.main.bounds.height * 0.4) - 40, item: ["","","","",""])
        // heightConstraints.constant = self.frame.height
       // self.layoutIfNeeded()
        clcDataSource.cellConfig = {(cell) in
            
            if let cell = cell as? CustomCell{
                
               
                
            }
            
            
        }
        
        clcVew.reloadData()
           clcDataSource.selected = { (indexPath) in
               
               print(indexPath.row)
               
           }
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

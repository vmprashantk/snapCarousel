//
//  CustomTableDataSource.swift
//  SnapCarouselDemo
//
//  Created by Prashant on 04/01/20.
//  Copyright © 2020 Prashant. All rights reserved.
//

import UIKit


typealias ConfigRow = (_ cell:Any) -> Void
class CustomTableDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    
    var tblView:UITableView?
    var row:Int?
    var height:CGFloat?
    var cofigRow:ConfigRow?
    
    init(tblView:UITableView,row:Int,height:CGFloat){
        
        super.init()
        self.tblView = tblView
        self.row = row
        self.height = height
        tblView.delegate = self
        tblView.dataSource = self
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return row ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tblView?.dequeueReusableCell(withIdentifier: "CustomTblCell")! else { return UITableViewCell() }
        if let configCell = cofigRow{
            
            configCell(cell)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return height ?? UITableView.automaticDimension
    }
}

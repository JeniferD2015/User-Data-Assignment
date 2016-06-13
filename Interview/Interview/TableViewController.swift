//
//  TableViewController.swift
//  Interview
//
//  Created by Jenifer  on 6/12/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    var usersArray : [User] = [User](){
        didSet{
            tableView.reloadData()
        }
    }
    var photosArray : [Photo] = [Photo](){
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "User List"
        
        tableView.registerClass(CustomCell.self, forCellReuseIdentifier: "cellId")
        
        self.title = "Users"
        
        self.navigationController!.navigationBar.barTintColor = UIColor.randomLightColor()
        
        //Get the user data from User Service
        UserWebservice.fetchAllUsers { (users) -> Void in
            
            if let users = users {
                //Get the main thread to update the UI
                dispatch_async(dispatch_get_main_queue()) {
                    self.usersArray = users
                }
            }
        }
        
        //Get photos
        PhotoService.fetchAllPhotos { (photos) -> Void in
            
            if let photos = photos {
                //Get the main thread to update the UI
                dispatch_async(dispatch_get_main_queue()) {
                    self.photosArray = photos
                    if (self.usersArray.count > 0) {
                        let photosArray = photos.prefix(self.usersArray.count)
                        self.photosArray = Array(photosArray)
                    }
                    else {
                        return
                    }
                }
            }
        }
        
        
        
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        
        return usersArray.count
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath) as! CustomCell
        cell.contentView.backgroundColor = UIColor.colorForCell()
        cell.nameLabel.backgroundColor = UIColor.clearColor()
        cell.nameLabel.text = usersArray[indexPath.row].name
        cell.nameLabel.textColor = UIColor.randomColor()
        if photosArray.count > 0 {
            
            let url = NSURL(string: photosArray[indexPath.row].thumbnailURL!)
            let data = NSData(contentsOfURL: url!)
            cell.imageView?.image  = UIImage(data: data!)
            cell.imageView!.layer.borderWidth = 3.0
            cell.imageView!.layer.borderColor = (UIColor.whiteColor()).CGColor
            
        }
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedRow = tableView.indexPathForSelectedRow?.row
        let selectedUser = usersArray[selectedRow!]
        
        let vc = DetailViewController()
        vc.selectedUser = selectedUser
        if photosArray.count > 0{
            vc.selectedPhoto = photosArray[selectedRow!]
        }
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterViewWithIdentifier("headerId")
    }
}

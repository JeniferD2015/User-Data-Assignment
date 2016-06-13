//
//  CustomCell.swift
//  Interview
//
//  Created by Jenifer  on 6/13/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var myTableVC: TableViewController?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFontOfSize(14)
        return label
    }()
    
    func setupView()  {
        
        addSubview(nameLabel)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-156-[_nameLabel(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["_nameLabel": nameLabel]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[_nameLabel]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["_nameLabel": nameLabel]))
        
    }
}



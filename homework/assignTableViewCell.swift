//
//  assignTableViewCell.swift
//  homework
//
//  Created by Kerri Shields on 4/28/17.
//  Copyright © 2017 Kerri Shields. All rights reserved.
//

import UIKit

class assignTableViewCell: UITableViewCell {

    
    let className = UILabel()
    let classDescrip = UILabel()
    let classDate = UILabel()
    
    
    override func layoutSubviews() {
        className.frame = CGRect(x: 15, y: 0, width: self.frame.width / 2, height: self.frame.height / 2)
        className.font = UIFont.systemFont(ofSize: 16)
        className.textColor = UIColor.black
        
        classDescrip.frame = CGRect(x: 15, y: self.frame.height / 2, width: self.frame.width / 2, height: self.frame.height / 2)
        classDescrip.font = UIFont.systemFont(ofSize: 13)
        classDescrip.textColor = UIColor.darkGray
        
        classDate.frame = CGRect(x: self.frame.width / 2 + 15, y: 0, width: self.frame.width / 2 - 30, height: self.frame.height)
        classDate.textAlignment = .right
        classDate.font = UIFont.systemFont(ofSize: 16)
        classDate.textColor = UIColor.black
        
        self.addSubview(className)
        self.addSubview(classDescrip)
        self.addSubview(classDate)
        
    }

}

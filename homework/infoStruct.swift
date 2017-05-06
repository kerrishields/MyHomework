//
//  infoStruct.swift
//  homework
//
//  Created by Kerri Shields on 4/26/17.
//  Copyright © 2017 Kerri Shields. All rights reserved.
//

import Foundation

class infoStruct: NSObject, NSCoding {
    
    var chooseClass = ""
    var dsc = ""
    var dueDate = Date()
    
    init(name: String, description: String, dueDate: Date) {
    self.chooseClass = name
        self.dsc = description
        self.dueDate = dueDate
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder){
        chooseClass = aDecoder.decodeObject(forKey: "chooseClass") as! String
        dsc = aDecoder.decodeObject(forKey: "dsc") as! String
        dueDate = aDecoder.decodeObject(forKey: "dueDate") as! Date
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(chooseClass, forKey: "chooseClass")
        aCoder.encode(dsc, forKey: "dsc")
        aCoder.encode(dueDate, forKey: "dueDate")
    }
    
}

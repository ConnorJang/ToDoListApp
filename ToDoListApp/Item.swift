//
//  Item.swift
//  ToDoListApp
//
//  Created by iMac03 on 2017-10-16.
//  Copyright © 2017 iMac03. All rights reserved.
//

import Foundation

// Item needs to conform to NSCoding protocol, to do this it needs to subclass NSObject
//    --> These are needed if we dont want our data resetting every time the app launches
class Item: NSObject, NSCoding {
    
    var name:String
    
    // Crete a persistent path on the file system where data will be saved and loaded
    // Outside of the class, access the path using "Item.ArchiveURL"
    static let Dir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = Dir.appendingPathComponent("items")
    
    init(name:String) {
        self.name = name
        super.init()
    }
    
    // Must implement both encode and init to save/load data properly
    // Prepares the class's info to be archived
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
    // Initializer unarchives the data when the class is created
    required convenience init?(coder aDecoder: NSCoder) {
        // Decodes the data as a string or nil
        let name = aDecoder.decodeObject(forKey: "name") as! String
        // Initializes item object with the decoded data
        self.init(name: name)
    }
}

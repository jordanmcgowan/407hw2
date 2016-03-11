//
//  eventClass.swift
//  hw2
//
//  Created by Jordan McGowan on 3/10/16.
//  Copyright © 2016 Jordan McGowan. All rights reserved.
//

import Foundation

class Event: NSObject {
    var _title:String! = ""
    var title:String {
        get {
            return _title
        }
        set (newTitle){
            _title = newTitle
        }
        
    }
    var _date:NSDate!
    var date:NSDate {
        get {
            return _date
        }
        set (newDate){
            _date = newDate
        }
    }
    
    
}
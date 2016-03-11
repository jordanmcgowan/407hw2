//
//  ViewController.swift
//  hw2
//
//  Created by Jordan McGowan on 3/7/16.
//  Copyright © 2016 Jordan McGowan. All rights reserved.
//

import UIKit
import EventKit
import Foundation


class addEvent: UIViewController {
    
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    var strDate = ""
    var eventArr: [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePicked(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        strDate = dateFormatter.stringFromDate(myDatePicker.date)
    }
    
    @IBAction func addEventAction(sender: AnyObject) {
        eventArr = [eventTitle.text!, strDate, String(count)]
        print("Events: ")
        print(eventArr)
        data.setValue(eventArr, forKey: "event " + String(count))
        events.append(eventTitle.text! + ": " + strDate + "-->" + String(count))
        ++count
        tmp = count
        data.setValue(count, forKey: "count")
        data.synchronize()
    }
    
    
}

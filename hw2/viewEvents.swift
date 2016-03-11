//
//  viewEvents.swift
//  hw2
//
//  Created by Jordan McGowan on 3/8/16.
//  Copyright © 2016 Jordan McGowan. All rights reserved.
//


import UIKit
import EventKit

class viewEvents: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var datepicker: UIDatePicker!
    var numTimesThru = 0
    var temp = 0
    var strDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func datePicked(sender: AnyObject) {
        textView.text = ""
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        strDate = dateFormatter.stringFromDate(datepicker.date)
        print(strDate)
        
        if count > 0 {
            for var i = 0; i < count; ++i {
                let date = events[i]
                var index = date.endIndex.advancedBy(-6)
                var substring = date.substringToIndex(index)
                var splitArr = substring.componentsSeparatedByString(": ")
                print(splitArr[1])
                if (strDate == splitArr[1]){
                    textView.text = textView.text + events[i] + "\n"
                }
//                else{
//                    textView.text = "There are no events today, dogg!"
//                }
            }
        }
        else{
            textView.text = "There are no events!"
        }
    }

}
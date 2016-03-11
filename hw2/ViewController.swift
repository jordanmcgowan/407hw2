//
//  ViewController.swift
//  hw2
//
//  Created by Jordan McGowan on 3/7/16.
//  Copyright © 2016 Jordan McGowan. All rights reserved.
//

import UIKit
import EventKit

var data = NSUserDefaults.standardUserDefaults()
var count = 0;
var events: [String] = [];
var timesMainLoaded = 0;
var tmp = 0;

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation())
//        data.removeObjectForKey("event 0")
//        data.removeObjectForKey("event 1")
//        data.removeObjectForKey("event 2")
//        data.removeObjectForKey("event 6")
//        data.synchronize()
//        print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation())
//        data.setValue(0, forKey: "count")
        data.synchronize()
        print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation())
        
        if let key = data.objectForKey("count"){
            count = Int(key as! NSNumber);
            print(count)
        }
        
        if timesMainLoaded == 0{
            for (var i = 0; i < count; ++i){
                if data.objectForKey("event " + String(i)) != nil{
                    let name = "event " + String(i)
                    let title = String(data.objectForKey("event " + String(i))![0])
                    let date = String(data.objectForKey("event " + String(i))![1])
                    let eventNum = String(data.objectForKey("event " + String(i))![2])
                    events.append(title + ": " + date + "--> " + eventNum)
                    tmp = count
                }
            }
        }
        else{
            for (var i = tmp; i < count; ++i){
                let name = "event " + String(i)
                let title = String(data.objectForKey("event " + String(i))![0])
                let date = String(data.objectForKey("event " + String(i))![1])
                let eventNum = String(data.objectForKey("event " + String(i))![2])
                events.append(title + ": " + date + "--> " + eventNum)
                events.append(title + ": " + date)
            }
            tmp = count
        }
        print("Events in VC: ")
        print(events)
        ++timesMainLoaded
        data.synchronize()
        //print(data.objectForKey("event 1"))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


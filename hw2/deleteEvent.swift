//
//  deleteEvent.swift
//  hw2
//
//  Created by Jordan McGowan on 3/8/16.
//  Copyright © 2016 Jordan McGowan. All rights reserved.
//

import UIKit
import EventKit


class deleteEvent: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var index = 9999
    var currentCell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
    var splitArr = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // UITableViewDataSource Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell! {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        splitArr = events[indexPath.row].componentsSeparatedByString("-->")
        print(splitArr[0])
        cell.textLabel?.text = splitArr[0] as! String
        print(indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as UITableViewCell
        index = indexPath!.row
    }
    
    @IBAction func deleteClicked(sender: AnyObject) {
        print("Index" + String(index))
        var text = currentCell.textLabel?.text
        for var i = 0; i <= index; ++i{
            print("Event[i]: ")
            print(events[i])
        }
        if events[index] == ((currentCell.textLabel?.text)! + (splitArr[1] as! String)){
            print("Matches text")
        }
        else{
            print("Doesnt match text")
        }
        events.removeAtIndex(index)
        data.removeObjectForKey("event " + String(splitArr[1]))
        data.synchronize()
    }
    
}

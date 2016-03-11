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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // UITableViewDataSource Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell! {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        cell.textLabel?.text = events[indexPath.row]
        print(indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as UITableViewCell
        index = indexPath!.row
    }
    
    @IBAction func deleteClicked(sender: AnyObject) {
        events.removeAtIndex(index)
        data.removeObjectForKey("event " + String(index))
        --count
        data.setValue(count, forKey: "count")
        data.synchronize()
    }
    
}

//
//  viewEventsViewController.swift
//  populateTableViewPractice
//
//  Created by Aaron Knaack on 10/27/15.
//  Copyright © 2015 Aaron Knaack. All rights reserved.
//

import Foundation
import UIKit

class viewEventsViewController: UITableViewController {
    
    //date sent from first view
    var dateRecieved : NSDate!
    
    //array of events with matching dates
    var events : [allEventsDS] = [];
    
    @IBOutlet var evntLog: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            checkForEvents(dateRecieved);
            if(eventsList.count == 0){
                return 1
            }
            else{
                return events.count
            }
    }
    
    //populate table's cells
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            let cell = UITableViewCell();
            if(events.count == 0){
                cell.textLabel!.text = "No events, tap add to make an event.";
                return cell;
            }else{
                let item = self.events[indexPath.row].getTitle()
                cell.textLabel!.text = item
                return cell}
    }
    
    
    //delete cells per request
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            
            let remove = events[indexPath.row]
            var index = 0
            
            for evt in eventsList{
                if evt.date ==  remove.date && evt.getTitle() == remove.getTitle() {
                    eventsList.removeAtIndex(index)
                }
                index++
            }
            tableView.reloadData()
        }
    }
    
    func checkForEvents(dt : NSDate){
        //format date
        let calendar = NSCalendar.currentCalendar()
        
        //empty list
        events = [];
        
        //format date to compare easily
        for date in eventsList{
            let day = calendar.ordinalityOfUnit(.Day, inUnit: .Year, forDate: date.date)
            let daydatepicker = calendar.ordinalityOfUnit(.Day, inUnit: .Year, forDate: dt)
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy"
            
            let year = formatter.stringFromDate(date.date)
            let yeardatepicker = formatter.stringFromDate(dt)
            
            
            //check for matching events on same day to populate list
            if day == daydatepicker && year == yeardatepicker{
                events.append(date)
            }
            
            
        }
    }
    
    
    
    //send date using segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAdd2" {
            
            let addEvent : addEventViewContoller = segue.destinationViewController as! addEventViewContoller
            addEvent.dateRecieved2 = dateRecieved!;
        }
    }
    
}
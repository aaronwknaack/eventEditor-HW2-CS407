//
//  allEventsDS.swift
//  populateTableViewPractice
//
//  Created by Aaron Knaack on 10/28/15.
//  Copyright © 2015 Aaron Knaack. All rights reserved.
//

import Foundation

//global variable for all events added and removed
var eventsList : Array<allEventsDS> = [];

class allEventsDS {

    var date : NSDate = NSDate();
    var title : String = "";
    
    func setDate( dateAdd : NSDate ){
        date = dateAdd;
    }
    
    func setTitle( ttl : String ){
        title = ttl;
    }
    
    func getDate() -> NSDate{
        return date;
    }
    
    func getTitle() -> String{
        return title;
    }
}
//
//  theEvents.swift
//  populateTableViewPractice
//
//  Created by Aaron Knaack on 10/28/15.
//  Copyright © 2015 Aaron Knaack. All rights reserved.
//
import UIKit
import CoreData

//enable readability between objc and swift
@objc(allEvents)

class allEvents: NSManagedObject {
    @NSManaged var title: String;
    @NSManaged var date: NSDate;
}

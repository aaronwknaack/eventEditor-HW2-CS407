//
//  addEventViewController.swift
//  populateTableViewPractice
//
//  Created by Aaron Knaack on 10/27/15.
//  Copyright © 2015 Aaron Knaack. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class addEventViewContoller: UIViewController {
    
    var dateRecieved2 : NSDate!
    
    @IBOutlet weak var eventTitle: UITextField! = nil;
    
    @IBAction func saveEvent(sender: AnyObject) {
        //store data
        let newEvent = allEventsDS();
        newEvent.setTitle(eventTitle.text!);
        newEvent.setDate(dateRecieved2);
        eventsList.append(newEvent)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
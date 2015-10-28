//
//  ViewController.swift
//  populateTableViewPractice
//
//  Created by Aaron Knaack on 10/27/15.
//  Copyright © 2015 Aaron Knaack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var pickDate: UIDatePicker!
    @IBAction func goToEvents(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //removes back button caused by navigation controller 'home' button item
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toList" {
            
            let nav : UINavigationController = segue.destinationViewController as! UINavigationController;
            let viewEventsVC1 : viewEventsViewController = nav.topViewController as! viewEventsViewController;
            viewEventsVC1.dateRecieved = pickDate.date;
        }
    }
    
}


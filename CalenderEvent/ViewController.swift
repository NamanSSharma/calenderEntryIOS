//
//  ViewController.swift
//  CalenderEvent
//
//  Created by Naman Sharma on 2017-10-05.
//  Copyright © 2017 Naman Sharma. All rights reserved.
//

import UIKit

//Step 1: Import Event Kit
import EventKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Step 2: Link a button to action function
    @IBAction func btnAddEventTapped(_ sender: Any) {
        
        //Step 2a: Add eventStore variable
        let eventStore:EKEventStore = EKEventStore()
        
        //Step 2b: Create the Calender Date/Title/Note if granted access
        eventStore.requestAccess(to: .event) {(granted, error) in
            if(granted) && (error == nil)
            {
                //print("granted\(granted)")
               // print("error\(error)")
                print(Date())
                let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = "Event Add Tester"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "This is a note"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do{
                    try eventStore.save(event, span: .thisEvent)
                    // present alert
                    let alert = UIAlertController(title: "Event Created", message: "Go to the calender to view your event", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }catch let error as NSError{
                   // print("Error :\(error)")
                }
                print("Save Event")
                
                
            }else{
                print("Error: :\(error)")
            }
        
        }
    }
    
    //Step 3: Go into info.plist and add Property "Privacy - Calenders Usage Description" and give it a value w/ type string
    
    //DONE!
}


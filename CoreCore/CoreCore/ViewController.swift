//
//  ViewController.swift
//  CoreCore
//
//  Created by vm mac on 19/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var speakers: [Speaker]?
    var events: [Event]?
    @IBOutlet weak var myLabel: UILabel!
    @IBAction func myLoad(sender: AnyObject) {
        self.loadData()
    }
    
    @IBAction func myRead(sender: AnyObject) {
        self.readData()
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        self.demoData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func demoData() {
        /* let firstStart: Bool? = NSUserDefaults.standardUserDefaults().objectForKey("firstStart") as? Bool */
        
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else{
            print("penis")
            return
        }
        print("penisleretour")
        let context = appDelegate.managedObjectContext
        
        /* if firstStart == nil || firstStart == true { */
            let speakerEntity: NSEntityDescription? = NSEntityDescription.entityForName("Speaker", inManagedObjectContext: context)
            print("BP1")
            let eventEntity: NSEntityDescription? = NSEntityDescription.entityForName("Event", inManagedObjectContext: context)
            print("BP2")
            if eventEntity != nil && speakerEntity != nil {
                print("BP3")
                let event1: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                let event2: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                let event3: Event = Event(entity : eventEntity!, insertIntoManagedObjectContext: context)
                print("BP4")
                event1.name = "Envenement 1"
                event1.date = NSDate()
                event1.latitude = 39
                event1.longitude = 40
                event2.name = "Envenement 2"
                event2.date = NSDate()
                event2.latitude = 35
                event2.longitude = 42
                event3.name = "Envenement 3"
                event3.date = NSDate()
                event3.latitude = -20
                event3.longitude = -60
                print("BP5")
                let speaker1: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker2: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker3: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker4: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker5: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                print("BP6")
                speaker1.name = "Parleur 1"
                speaker1.age = 42
                speaker2.name = "Parleur 2"
                speaker2.age = 56
                speaker3.name = "Parleur 3"
                speaker3.age = 69
                speaker4.name = "Parleur 4"
                speaker4.age = 36
                speaker5.name = "Parleur 5"
                speaker5.age = 29
                print("BP7")
                var currentSet1: Set<Speaker> = Set<Speaker>()
                var currentSet2: Set<Speaker> = Set<Speaker>()
                var currentSet3: Set<Speaker> = Set<Speaker>()
                print("BP8")
                currentSet1.insert(speaker1)
                currentSet1.insert(speaker3)
                currentSet1.insert(speaker5)
                currentSet2.insert(speaker5)
                currentSet2.insert(speaker2)
                currentSet2.insert(speaker4)
                currentSet3.insert(speaker1)
                currentSet3.insert(speaker4)
                currentSet3.insert(speaker3)
                currentSet3.insert(speaker5)
                print("BP9")
                event1.speaker = NSSet(set: currentSet1)
                event2.speaker = NSSet(set: currentSet2)
                event3.speaker = NSSet(set: currentSet3)
                print("BP10")
                print(event1.name)
                print("BP11")

            //}
            
            //if appDelegate.managedObjectContext.hasChanges {
                appDelegate.saveContext()
                print("BP12")
                //NSUserDefaults.standardUserDefaults().setObject(false, forKey: "firstStart")
            //}
        }
    }
    
    func loadData() {
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else{
            return
        }
        
        let fetchRequestEvent = NSFetchRequest(entityName: "Event")
        let fetchRequestSpeaker = NSFetchRequest(entityName: "Speaker")
        
        do {
            if let results = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequestEvent) as? [Event]
            {
                self.events = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of Event! \(error)")
        }
        
        do {
            if let results = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequestSpeaker) as? [Speaker]
            {
                self.speakers = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of Event! \(error)")
        }
        
    }
    
    func readData() {
        
        guard let evenements = speakers else {
            self.myLabel.text = "Penis"
            return
        }
        
        
        for evt in evenements {
            
            self.myLabel.text = evt.name
        }
        
        // self.myLabel.text = "Penis"
        
    }
}


//
//  Event+CoreDataProperties.swift
//  CoreCore
//
//  Created by vm mac on 19/03/2016.
//  Copyright © 2016 Casati-Vasseur. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Event {

    @NSManaged var date: NSDate?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var name: String?
    @NSManaged var speaker: NSSet?

}

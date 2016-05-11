//
//  WeaponTable.swift
//  DS Weapons
//
//  Created by Yanliang Gu on 5/10/16.
//  Copyright © 2016 Yanliang Gu. All rights reserved.
//

import Foundation
import CoreData


class WeaponTable: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged var name: String
    @NSManaged var image: String
    
    
    class func createInManageObjectContext(moc: NSManagedObjectContext, weaponName: String, weaponImage: String) -> WeaponTable {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("WeaponTable", inManagedObjectContext: moc) as! WeaponTable
        newItem.name = weaponName
        newItem.image = weaponImage
        self.saveContext(moc)
        return newItem
    }
    
    class func saveContext(moc: NSManagedObjectContext) {
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    class func fetchAll(moc: NSManagedObjectContext) -> Array<WeaponTable>? {
        let fetchRequest = NSFetchRequest(entityName: "WeaponTable")
        let fetchResults = (try! moc.executeFetchRequest(fetchRequest) as? [WeaponTable])
        if fetchResults?.count == 0 {
            return nil
        } else {
           return fetchResults
        }
    }
}

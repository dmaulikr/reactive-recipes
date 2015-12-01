//
//  CoreData+FirstTimeLoad.swift
//  reactive-recipe-2
//
//  Created by krawiecp on 28/11/2015.
//  Copyright © 2015 Pawel Krawiec. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataStack {
    func loadFirstTimeData() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        guard (userDefaults.boolForKey("firstTimeDataLoaded") == false) else {
            return
        }
        userDefaults.setBool(true, forKey: "firstTimeDataLoaded")
        
        for (index, itemContent) in ["Walk out dog", "Wash car"].enumerate() {
            let item = NSEntityDescription.insertNewObjectForEntityForName("Item", inManagedObjectContext: context) as! Item
            item.content = itemContent
            item.position = index
            item.done = false
        }
        do {
            try context.save()
        } catch {
            print("Failed to save to CoreData")
        }
    }
}
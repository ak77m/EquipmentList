//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData
import CloudKit

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        
        
        // Local Storage
        //persistentContainer = NSPersistentContainer(name: "EquipmentList")

        // ------- Cloud Storage
        persistentContainer = NSPersistentCloudKitContainer(name: "EquipmentList") // Cloud Storage
        persistentContainer.persistentStoreDescriptions.first!.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        // ------- Cloud Storage
        
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialise Core Data \(error)")
            }
        }
        
        //let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        //print(directories[0])
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext 
    }
    
}



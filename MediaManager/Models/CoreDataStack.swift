//
//  CoreDataStack.swift
//  MediaManager
//
//  Created by Mackenzie Wacker on 12/9/22.
//

import CoreData

// MARK: - Core Data stack
enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MediaManager")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading persistent stores \(error)")
            }
        }
        return container
    } ()
    
    static var context: NSManagedObjectContext { container.viewContext}
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                NSLog("Error saving context \(error)")
            }
        }
    }
}


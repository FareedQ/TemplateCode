//
//  Student.swift
//  PlayingWithSwiftUI
//
//  Created by Fareed Quraishi on 2023-01-25.
//

// **Note will also need to add this to the app contextview
// .environment(\.managedObjectContext, dataController.container.viewContext)

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

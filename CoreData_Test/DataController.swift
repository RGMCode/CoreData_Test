//
//  DataController.swift
//  CoreData_Test
//
//  Created by RGMCode on 03.06.24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    var container: NSPersistentContainer
    
    init(name: String) {
        container = NSPersistentContainer(name: name)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("CoreData Error: \(error.localizedDescription)")
            }
        }
    }
    
}

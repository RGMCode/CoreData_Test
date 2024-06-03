//
//  CoreData_TestApp.swift
//  CoreData_Test
//
//  Created by RGMCode on 03.06.24.
//

import SwiftUI

@main
struct CoreData_TestApp: App {
    
    @StateObject private var dataController = DataController(name: "Model")
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
        
    }
    
}

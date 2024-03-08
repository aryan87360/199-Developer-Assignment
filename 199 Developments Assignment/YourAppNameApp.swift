//
//  _99_Developments_AssignmentApp.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//

import SwiftUI

@main
struct YourAppNameApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var notesManager = NotesManager()
    @State private var isLoggedIn: Bool = false // Assume the default is not logged in

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
              NavigationView {
                HomeView()
                  .environment(\.managedObjectContext, persistenceController.container.viewContext)
                  .environmentObject(notesManager) // Pass notesManager here
                // Other views requiring notesManager can be added here
              }
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(notesManager)
            }
        }
    }
}




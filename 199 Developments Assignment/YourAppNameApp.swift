//
//  _99_Developments_AssignmentApp.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//

import SwiftUI

@main
struct YourAppNameApp: App {
    @StateObject private var notesManager = NotesManager()
    @State private var isLoggedIn: Bool = false // Assume the default is not logged in

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {

                NavigationView {
                    HomeView()
                        .environmentObject(notesManager)
                }
            } else {

                LoginView(isLoggedIn: $isLoggedIn)
                    .environmentObject(notesManager)
            }
        }
    }
}



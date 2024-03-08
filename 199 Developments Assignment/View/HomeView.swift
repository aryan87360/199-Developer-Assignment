//
//  HomeView.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//


// HomeView.swift

// HomeView.swift

import SwiftUI

struct HomeView: View {
    // Add @EnvironmentObject here if it's not already in the parent view
    @EnvironmentObject var notesManager: NotesManager

    @State private var selectedNote: Note?

    var body: some View {
        NavigationView {
            List {
                ForEach(notesManager.notes) { note in
                    NavigationLink(destination: DetailView(note: note), tag: note, selection: $selectedNote) {
                        NoteRow(note: note)
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        notesManager.removeNote(at: index)
                    }
                })
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: NavigationLink(destination: AddNoteView()) {
                Image(systemName: "plus")
            })
        }
        // Ensure that the environment object is passed to the child view
        .environmentObject(notesManager)
    }
}


#Preview {
    HomeView()
        .environmentObject(NotesManager())
}




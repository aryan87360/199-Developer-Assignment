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
    }
}


#Preview {
    HomeView()
        .environmentObject(NotesManager())
}




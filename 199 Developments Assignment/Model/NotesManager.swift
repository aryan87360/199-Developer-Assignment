//
//  NotesManager.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//

import SwiftUI

class NotesManager: ObservableObject {
    @Published var notes: [Note] = [] {
        didSet {
            saveNotes()
        }
    }

    private let notesKey = "userNotes"

    init() {
        loadNotes()
    }

    private func saveNotes() {
        do {
            let encodedData = try JSONEncoder().encode(notes)
            UserDefaults.standard.set(encodedData, forKey: notesKey)
        } catch {
            print("Error encoding notes: \(error)")
        }
    }


    private func loadNotes() {
        if let encodedData = UserDefaults.standard.data(forKey: notesKey) {
            do {
                notes = try JSONDecoder().decode([Note].self, from: encodedData)
            } catch {
                print("Error decoding notes: \(error)")
            }
        }
    }


    func addNote(title: String, description: String, photoData: Data?) {
        let newNote = Note(title: title, description: description, photoData: photoData)
        notes.append(newNote)
        
    }


    func removeNote(at index: Int) {
        guard notes.indices.contains(index) else {
            return // Index out of bounds
        }
        notes.remove(at: index)
    }


    func updateNote(at index: Int, title: String, description: String, photoData: Data?) {
        guard notes.indices.contains(index) else {
            return // Index out of bounds
        }
        notes[index].title = title
        notes[index].description = description
        notes[index].photoData = photoData
    }
}

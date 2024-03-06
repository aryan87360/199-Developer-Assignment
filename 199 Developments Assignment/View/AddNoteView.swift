//
//  AddNoteView.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//

import SwiftUI

struct AddNoteView: View {
    @EnvironmentObject var notesManager: NotesManager
    @State private var noteTitle: String = ""
    @State private var noteDescription: String = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented: Bool = false

    var body: some View {
        VStack {
            TextField("Note Title (5-100 characters)", text: $noteTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(maxHeight: 100)

            TextEditor(text: $noteDescription)
                .padding()
                .frame(height: 200) // Adjust the height as needed

            Button("Add Photo") {
                isImagePickerPresented.toggle()
            }
            .padding()

            Button("Add Note") {
                // Convert Image to Data if available
                let imageData = selectedImage?.jpegData(compressionQuality: 0.8)
                notesManager.addNote(title: noteTitle, description: noteDescription, photoData: imageData)
            }
            .padding()
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePickerView(selectedImage: $selectedImage)
            }
        }
        .padding()
        .navigationTitle("Add Note")
    }
}






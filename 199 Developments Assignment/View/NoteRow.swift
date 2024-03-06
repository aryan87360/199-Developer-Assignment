//
//  NotesView.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//

// NoteRow.swift

import SwiftUI

struct NoteRow: View {
    var note: Note

    var body: some View {
        NavigationLink(destination: DetailView(note: note)) {
            HStack {
                if let uiImage = UIImage(data: note.photoData ?? Data()) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(5)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(5)
                        .foregroundColor(.gray)
                }

                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.headline)
                    Text(note.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            .padding()
        }
    }
}

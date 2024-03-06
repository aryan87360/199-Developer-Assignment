//
//  DetailView.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//

import SwiftUI

struct DetailView: View {
    var note: Note

    var body: some View {
        ScrollView {
            VStack {
                if let uiImage = UIImage(data: note.photoData ?? Data()) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.gray)
                }

                Text(note.title)
                    .font(.title)
                    .padding()

                Text(note.description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding()

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Note Details")
    }
}





//
//  Notes.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//

// Note.swift

import SwiftUI

struct Note: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var photoData: Data?

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}


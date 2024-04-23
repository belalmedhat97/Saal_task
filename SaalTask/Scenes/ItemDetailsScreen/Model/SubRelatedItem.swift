//
//  SubRelatedItem.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import Foundation
import SwiftData
@Model class SubRelatedItem: Identifiable {
    var id: UUID
    var name: String
    var type: String
    var objectDescription: String
    var creationDate: Date
    var item: Item?
    init(id: UUID = UUID(), name: String, type: String, objectDescription: String, creationDate: Date) {
        self.id = id
        self.name = name
        self.type = type
        self.objectDescription = objectDescription
        self.creationDate = creationDate
    }
}

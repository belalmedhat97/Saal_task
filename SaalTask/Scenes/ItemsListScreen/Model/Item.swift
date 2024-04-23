//
//  Item.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID
    var name: String
    var type: String
    var objectDescription: String
    var creationDate: Date
    @Relationship(deleteRule: .cascade) var subItem: [SubRelatedItem]?
    init(id: UUID = UUID(), name: String, type: String, objectDescription: String, creationDate: Date) {
        self.id = id
        self.name = name
        self.type = type
        self.objectDescription = objectDescription
        self.creationDate = creationDate
        self.subItem = []
    }
}

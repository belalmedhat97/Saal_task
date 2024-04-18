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
    var id = UUID()
    var name: String
    var type: String
    var objectDescription: String
    var creationDate: Date
    @Relationship(deleteRule: .cascade) var subItem: [SubRelatedItem]?
    init(name: String, type: String, objectDescription: String, creationDate: Date) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.objectDescription = objectDescription
        self.creationDate = creationDate
        self.subItem = []
    }
}

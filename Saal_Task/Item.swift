//
//  Item.swift
//  Saal_Task
//
//  Created by belal medhat on 17/04/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String
    var type: String
    var object_description: String
    
    init(name: String, type: String, object_description: String) {
        self.name = name
        self.type = type
        self.object_description = object_description
    }
}

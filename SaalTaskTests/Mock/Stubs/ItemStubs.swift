//
//  ItemStubs.swift
//  SaalTaskTests
//
//  Created by belal medhat on 18/04/2024.
//

import Foundation
@testable import SaalTask
// Stub for testing with 10 elements of Item
class ItemsDataStubs {
    final func getStubs() -> [Item] {
        var items: [Item] = []

        for count in 1...10 {
            let itemName = "Item \(count)"
            let itemType = "Type \(count)"
            let itemDescription = "Description for Item \(count)"
            let itemCreationDate = Date()

            let item = Item(name: itemName,
                            type: itemType,
                            objectDescription: itemDescription,
                            creationDate: itemCreationDate)

            // Add sub-items to each item
            var subItems: [SubRelatedItem] = []
            for subCount in 1...3 {
                let subItemName = "SubItem \(subCount)"
                let subItemType = "SubItemType \(subCount)"
                let subItemDescription = "Description for SubItem \(subCount)"
                let subItemCreationDate = Date()

                let subItem = SubRelatedItem(name: subItemName,
                                             type: subItemType,
                                             objectDescription: subItemDescription,
                                             creationDate: subItemCreationDate)
                subItems.append(subItem)
            }

            item.subItem = subItems
            items.append(item)
        }

        return items
    }
}

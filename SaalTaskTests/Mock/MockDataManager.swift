//
//  MockDataManager.swift
//  SaalTaskTests
//
//  Created by belal medhat on 18/04/2024.
//

import Foundation
@testable import SaalTask
// Mock DataManager for testing
class MockDataManager: DataManagerProtocol {
    var itemsToReturn: [Item]? = ItemsDataStubs().getStubs()
    var shouldThrowError: Bool = false

    func createItem(_ item: Item) throws {
        if shouldThrowError {
             throw NSError(domain: "", code: 0, userInfo: nil)
        } else {
            itemsToReturn?.append(item)
        }
    }
    func deleteItem(_ item: Item) throws {
        // Implement if needed
        if shouldThrowError {
             throw NSError(domain: "", code: 0, userInfo: nil)
        } else {
            if let index = itemsToReturn?.firstIndex(where: {$0.name == item.name}) {
                itemsToReturn?.remove(at: index)
            }
        }

    }
    func updateItem(oldItem: Item, newItem: Item) throws {
        // Implement if needed
    }
    func fetchItems() throws -> [Item]? {
        if shouldThrowError {
            throw NSError(domain: "", code: 0, userInfo: nil)
        } else {
            return itemsToReturn
        }
    }
    func searchItem(with: String) throws -> [Item]? {
        if shouldThrowError {
             throw NSError(domain: "", code: 0, userInfo: nil)
        } else {
            if let index = itemsToReturn?.firstIndex(where: {$0.name == with}) {
                if let foundedItem = itemsToReturn?[index] {
                    return [foundedItem]
                }
            }
        }
        return []
    }
}

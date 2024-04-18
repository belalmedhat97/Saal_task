//
//  SwiftDataManager.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import Foundation
import SwiftData

protocol DataManagerProtocol {
    func createItem(_ item: Item) throws
    func fetchItem() throws -> [Item]?
    func updateItem(oldItem: Item, newItem: Item) throws
    func deleteItem(_ item: Item) throws
    func searchItem(with: String) throws -> [Item]?
}
class SwiftDataManager: DataManagerProtocol {
    var container: ModelContainer?
    var context: ModelContext?
    init() {
        do {
            container = try ModelContainer(for: Item.self)
            if let container {
                context = ModelContext(container)
            }
        } catch {
            print(error)
        }
    }
    func createItem(_ item: Item) throws {
        if let context {
            context.insert(item)
            try save()
        }
    }
    func fetchItem() throws -> [Item]? {
        let fetchDescriptor = FetchDescriptor<Item>(sortBy: [SortDescriptor<Item>(\.creationDate)])
        if let context {
            do {
                let data = try context.fetch(fetchDescriptor)
                return data
            } catch {
                throw error
            }
        }
        return []
    }
    func updateItem(oldItem: Item, newItem: Item) throws {
        let itemToBeUpdated = oldItem
        itemToBeUpdated.name = newItem.name
        itemToBeUpdated.type = newItem.type
        itemToBeUpdated.objectDescription = newItem.objectDescription
        itemToBeUpdated.creationDate = newItem.creationDate
        try save()
    }
    func deleteItem(_ item: Item) throws {
        if let context {
            context.delete(item)
            try save()
        }
    }
    private func save() throws {
        guard context?.hasChanges == true else { return }
        do {
            try context?.save()
        } catch {
            throw error
        }
    }
    func searchItem(with name: String) throws -> [Item]? {
        let descriptor = FetchDescriptor<Item>(predicate: #Predicate {
            $0.name.localizedStandardContains(name.localizedLowercase)
        }, sortBy: [SortDescriptor<Item>(\.creationDate)])
         if let context {
            do {
                let data = try context.fetch(descriptor)
                return data
            } catch {
                throw error
            }
        }
        return []
    }
}

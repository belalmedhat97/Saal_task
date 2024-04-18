//
//  ItemDetailsViewModel.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import Foundation
import SwiftData
protocol ItemDetailsViewModelProtocols: ObservableObject {
    var dataManagerService: DataManagerProtocol? {get set}
    var listOfItems: [Item]? {get}
    var vmError: (show: Bool, txt: String) {get set}
    func deleteItem(_ items: Item, itemInRelation: SubRelatedItem)
    func updateItem(oldItem: Item, with: [Item])
    func fetchItems()
}
class ItemDetailsViewModel: ItemDetailsViewModelProtocols {
    var dataManagerService: DataManagerProtocol?
    @Published var listOfItems: [Item]? = []
    @Published var vmError: (show: Bool, txt: String) = (false, "")
    private var dataToBeAllocated = [SubRelatedItem]()

    init(dataManagerService: DataManagerProtocol) {
        self.dataManagerService = dataManagerService
        self.fetchItems()
    }
    func fetchItems() {
        do {
            listOfItems = try dataManagerService?.fetchItems()
        } catch {
            vmError = (true, error.localizedDescription)
        }
    }
    func deleteItem(_ item: Item, itemInRelation: SubRelatedItem) {
        let itemToBeDeleted = item
        itemToBeDeleted.subItem?.removeAll(where: { subRelatedItem in
            subRelatedItem.id == itemInRelation.id
        })
    }
    func updateItem(oldItem: Item, with: [Item]) {
        let itemToBeUpdated = oldItem
        var arrayOfRelated = [SubRelatedItem]()
        for subItem in with {
        arrayOfRelated.append(SubRelatedItem(name: subItem.name,
                                                 type: subItem.type,
                                                 objectDescription: subItem.objectDescription,
                                                 creationDate: subItem.creationDate))
        }
        itemToBeUpdated.subItem?.append(contentsOf: arrayOfRelated)
    }

}

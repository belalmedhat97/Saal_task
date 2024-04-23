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
    func deleteItem(itemInRelation: SubRelatedItem)
    func updateItem(with: [Item])
    func fetchItems()
}
class ItemDetailsViewModel: ItemDetailsViewModelProtocols {
    var dataManagerService: DataManagerProtocol?
    var selectedItem: Item?
    @Published var listOfItems: [Item]? = []
    @Published var vmError: (show: Bool, txt: String) = (false, "")
    init(dataManagerService: DataManagerProtocol, selectedItem: Item? = nil) {
        self.dataManagerService = dataManagerService
        self.selectedItem = selectedItem
        self.fetchItems()
    }
    func fetchItems() {
        do {
            var removedAlreadySavedItem: Set<Item> = []
            let fetchedItems = try dataManagerService?.fetchItems()?.filter({ $0.id != selectedItem?.id })
            guard selectedItem?.subItem?.count != 0 else { listOfItems = fetchedItems
                return }
            fetchedItems?.forEach({ item in
                var idWasFounded = false
                selectedItem?.subItem?.forEach { subRelatedItem in
                    if item.id == subRelatedItem.id {
                        idWasFounded = true
                    }
                }
                if idWasFounded == false {
                    removedAlreadySavedItem.insert(item)
                }
            })
            listOfItems = Array(removedAlreadySavedItem)
        } catch {
            vmError = (true, error.localizedDescription)
        }
    }
    func deleteItem(itemInRelation: SubRelatedItem) {
        selectedItem?.subItem?.removeAll(where: { subRelatedItem in
            subRelatedItem.id == itemInRelation.id
        })
        fetchItems()
    }
    func updateItem(with: [Item]) {
        var arrayOfRelated = [SubRelatedItem]()
        for subItem in with {
            arrayOfRelated.append(SubRelatedItem(id: subItem.id, name: subItem.name,
                                                 type: subItem.type,
                                                 objectDescription: subItem.objectDescription,
                                                 creationDate: subItem.creationDate))
        }
        selectedItem?.subItem?.append(contentsOf: arrayOfRelated)
        fetchItems()
    }
}

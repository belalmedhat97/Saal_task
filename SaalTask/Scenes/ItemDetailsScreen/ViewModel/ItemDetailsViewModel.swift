//
//  ItemDetailsViewModel.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import Foundation
protocol ItemDetailsViewModelProtocols: ObservableObject {
    var dataManagerService: DataManagerProtocol? {get set}
    var listOfRelationItems: [Item]? {get}
    var vmError: (show: Bool, txt: String) {get set}
    func deleteItem(_ items: Item, itemInRelation: SubRelatedItem)
    func updateItem(oldItem: Item, with: [Item])
    func fetchItems()
}
class ItemDetailsViewModel: ItemDetailsViewModelProtocols {
    var dataManagerService: DataManagerProtocol?
    @Published var listOfRelationItems: [Item]? = []
    @Published var vmError: (show: Bool, txt: String) = (false, "")

    init(dataManagerService: DataManagerProtocol) {
        self.dataManagerService = dataManagerService
        self.fetchItems()
    }
    func fetchItems() {
        do {
            listOfRelationItems = try dataManagerService?.fetchItem()
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
                                                 itemDescription: subItem.objectDescription,
                                                 creationDate: subItem.creationDate))
        }
        itemToBeUpdated.subItem = arrayOfRelated
    }

}

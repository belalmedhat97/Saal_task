//
//  ItemListViewModel.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import Foundation

protocol ItemListViewModelProtocols: ObservableObject {
    var dataManagerService: DataManagerProtocol? {get set}
    var listOfItems: [Item]? {get}
    var vmError: (show: Bool, txt: String) {get set}
    func createObject(_ item: Item)
    func deleteItem(_ item: Item)
    func searchItem(_ name: String)
    func fetchItems()
}

class ItemListViewModel: ItemListViewModelProtocols {
    var dataManagerService: DataManagerProtocol?
    @Published var listOfItems: [Item]? = []
    @Published var vmError: (show: Bool, txt: String) = (false, "")

    init(dataManagerService: DataManagerProtocol) {
        self.dataManagerService = dataManagerService
        self.fetchItems()
    }
    func createObject(_ item: Item) {
        guard validateTextInputOfItem(item: item) else { return }
        do {
            try dataManagerService?.createItem(item)
            fetchItems()
        } catch {
            vmError = (true, error.localizedDescription)
        }
    }
    func fetchItems() {
        do {
            listOfItems = try dataManagerService?.fetchItems()
        } catch {
            vmError = (true, error.localizedDescription)
        }
    }
    func deleteItem(_ item: Item) {
        do {
            try dataManagerService?.deleteItem(item)
            fetchItems()
        } catch {
            vmError = (true, error.localizedDescription)
        }
    }
    func searchItem(_ name: String) {
        do {
            listOfItems = try dataManagerService?.searchItem(with: name)
        } catch {
            vmError = (true, error.localizedDescription)
        }
    }
    private func validateTextInputOfItem(item: Item) -> Bool {
        guard item.name != "", item.type != "", item.objectDescription.description != "" else {
             vmError = (true, "all fields must be filled")
            return false
        }
        return true
        }
    }

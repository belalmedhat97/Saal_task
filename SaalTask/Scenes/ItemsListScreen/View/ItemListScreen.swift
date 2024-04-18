//
//  ItemListView.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI
import SwiftData

struct ItemListView<VM>: View where VM: ItemListViewModelProtocols {
    @StateObject var viewModel: VM
    @State private var searchText: String = ""
    @State private var showInputField: Bool = false
    @State private var isEditing: Bool = false
    @State private var newItem: Item = Item(name: "", type: "", itemDescription: "", creationDate: Date.now)
    @State private var oldItem: Item = Item(name: "", type: "", itemDescription: "", creationDate: Date.now)
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SearchBar(text: $searchText, onStartSearch: { text in
                        text != "" ? viewModel.searchItem(text) : viewModel.fetchItems()
                    })
                    List(viewModel.listOfItems ?? []) { item in
                        ItemCell(item: item,
                                 onEditTap: {
                            oldItem = item
                            self.isEditing = true
                            self.showInputField.toggle()
                        }, onDeleteTap: {
                            viewModel.deleteItem(item)
                        })
                    }.background(Color(UIColor.lightGray)).listRowSpacing(20)
                }
                FloatingAddButton {
                    showInputField.toggle()
                }.sheet(isPresented: $showInputField) {
                    VStack {
                        Text("ADD NEW ITEM")
                            .font(.headline)
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                        ItemSheet(newItemData: $newItem,
                                  isShown: $showInputField,
                                  inEditMode: $isEditing) { mode in
                            (mode == .create ? viewModel.createObject(newItem) :
                                viewModel.updateItem(oldItem: oldItem, newItem: newItem))
                            self.isEditing = false
                        } onCancelTap: {
                            viewModel.fetchItems()
                            self.isEditing = false
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Objects")
        }
    }
}

#Preview {
    ItemListView(viewModel: ItemListViewModel(dataManagerService: SwiftDataManager()))
}

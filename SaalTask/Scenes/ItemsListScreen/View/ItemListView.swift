//
//  ItemListView.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI
struct ItemListView<VM>: View where VM: ItemListViewModelProtocols {
    @StateObject var viewModel: VM
    @State private var searchText: String = ""
    @State private var showInputField: Bool = false
    @State private var isEditing: Bool = false
    @State private var newItem: Item = Item(name: "", type: "", objectDescription: "", creationDate: Date.now)
    @EnvironmentObject var navState: NavigatorAppState
    var body: some View {
        NavigationStack(path: $navState.path) {
            ZStack {
                VStack {
                    SearchBar(text: $searchText, onStartSearch: { text in
                        text != "" ? viewModel.searchItem(text) : viewModel.fetchItems()
                    })
                    List(viewModel.listOfItems ?? []) { item in
                        Button(action: {
                            navState.path.append(item)
                        }, label: {
                            ItemCell(item: item, onEditTap: {
                            navState.path.append(item)
                            }, onDeleteTap: {
                                viewModel.deleteItem(item)
                            })
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
                                  isShown: $showInputField) {
                            viewModel.createObject(newItem)
                        } onCancelTap: {
                            viewModel.fetchItems()
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Objects").navigationDestination(for: Item.self) { selectedItem in
                    ItemDetailsView(viewModel: ItemDetailsViewModel(dataManagerService: SwiftDataManager()), item: selectedItem)
                }
        }.alert(viewModel.vmError.txt, isPresented: $viewModel.vmError.show) {
        }
    }
}
#Preview {
    ItemListView(viewModel: ItemListViewModel(dataManagerService: SwiftDataManager()))
        .environmentObject(NavigatorAppState())
}

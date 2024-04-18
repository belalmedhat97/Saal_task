//
//  ItemDetailsView.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import SwiftUI
struct ItemDetailsView<VM>: View where VM: ItemDetailsViewModelProtocols {
    @StateObject var viewModel: VM
    @State private var showInputField: Bool = false
    @State var item: Item = Item(name: "", type: "", itemDescription: "", creationDate: Date.now)
    @EnvironmentObject var navState: NavigatorAppState
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                PlaceholderTextField(placeholder: "Type", text: $item.type)
                PlaceholderTextField(placeholder: "Name", text: $item.name)
                PlaceholderTextField(placeholder: "Description", text: $item.objectDescription)
                Text("Relations:")
                    .font(.headline)
                    .padding(.top)
                List(item.subItem ?? [], id: \.self) { item in
                    Button(action: {
                        navState.path.append(item)
                    }, label: {
                        ItemCell(item: Item(name: item.name,
                                            type: item.type,
                                            itemDescription: item.objectDescription,
                                            creationDate: item.creationDate),
                                 onEditTap: {
                            navState.path.append(item)
                        }, onDeleteTap: {
                            viewModel.deleteItem(self.item, itemInRelation: item)
                        })
                    })
                }.background(Color(UIColor.lightGray)).listRowSpacing(20).clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
            FloatingAddButton {
                showInputField.toggle()
            }.sheet(isPresented: $showInputField) {
                VStack {
                    Text("SELECT A RELATION")
                        .font(.headline)
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible)
                    ItemsListSheet(items: viewModel.listOfRelationItems ?? [],
                                   isShown: $showInputField) { items in
                        viewModel.updateItem(oldItem: item, with: Array(items))
                    } onCancelTap: {
                        viewModel.fetchItems()
                    }.onAppear(perform: {
                        viewModel.fetchItems()
                    })
                }.padding().clipShape(RoundedRectangle(cornerRadius: 20))
            }

        }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edit Objects")
            .background(Color(UIColor.lightGray)).navigationDestination(for: SubRelatedItem.self) { selectedItem in
                EditRelationItemView(item: selectedItem)
            }
    }
}
#Preview {
    ItemDetailsView(viewModel: ItemDetailsViewModel(dataManagerService: SwiftDataManager()))
}

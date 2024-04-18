//
//  ItemCellSelection.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import SwiftUI

struct ItemCellSelection: View {
    var item: Item
//    var onSelectTap: (_ item: Item) -> Void
    @Binding var selection: Set<Item>
    @State private var isSelected: Bool = false
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(content: {
                    Text("\(item.type) :")
                        .font(.headline)
                    Text(item.name)
                        .font(.subheadline)
                })
                Text(item.objectDescription)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Created on \(item.creationDate.formatted())")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                selection.insert(item)
                isSelected.toggle()}, label: {
                    Image(systemName: isSelected == true ? "checkmark.circle.fill" : "circle")
            })
        }.padding(20)
            .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))}
    }

#Preview {
    ItemCellSelection(item: Item(name: "Saal",
                                type: "ART",
                                itemDescription: "test project",
                                 creationDate: Date.now), selection: .constant([]))
}

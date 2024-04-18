//
//  ItemCell.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI

struct ItemCell: View {
    var item: Item
    var onEditTap: () -> Void
    var onDeleteTap: () -> Void
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
            Menu {
                Button(action: {
                    onEditTap()
                }) {
                    Text("Edit")
                    Image(systemName: "pencil")
                }
                Button(action: {
                    onDeleteTap()
                }) {
                    Text("Delete")
                    Image(systemName: "trash")
                }
            } label: {
                Image(systemName: "ellipsis.circle.fill")
                    .foregroundColor(.blue)
            }.padding()
        }.padding(20)
            .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))}
}

#Preview {
    ItemCell(item: Item(name: "Saal", 
                        type: "WallART",
                        itemDescription: "WallART for test project",
                        creationDate: Date.now), onEditTap: {}, onDeleteTap: {})
}

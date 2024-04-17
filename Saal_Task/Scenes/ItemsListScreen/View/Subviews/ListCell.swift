//
//  ListCell.swift
//  Saal_Task
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI

struct ListCell: View {
    var item: Item
    var onEdit: () -> Void
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(content: {
                    Text("\(item.type) :")
                        .font(.headline)
                    Text(item.name)
                        .font(.subheadline)
                })

                Text(item.object_description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis.circle.fill")
                .foregroundColor(.blue)
                .contextMenu {
                    Button(action: {
                        onEdit()
                    }) {
                        Text("Edit")
                        Image(systemName: "pencil")
                    }
                    
                    Button(action: {
                        onDelete()
                    }) {
                        Text("Delete")
                        Image(systemName: "trash")
                    }
                }
                .padding()
        }.padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))}
}

#Preview {
    ListCell(item: Item(name: "Saal", type: "WallART", object_description: "WallART for test project"), onEdit: {}, onDelete: {})
}

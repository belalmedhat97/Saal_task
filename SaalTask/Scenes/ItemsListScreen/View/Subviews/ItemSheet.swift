//
//  InputItem.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI
struct ItemSheet: View {
    @Binding var newItemData: Item
    @Binding var isShown: Bool
    var onSaveTap: () -> Void
    var onCancelTap: () -> Void
    var body: some View {
        VStack {
            TextField("Name", text: $newItemData.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Type", text: $newItemData.type)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Description", text: $newItemData.objectDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack(spacing: 20) {
                Button("SAVE") {
                    onSaveTap()
                    resetTextFields()
                }.padding(10).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 10))
                Button("CANCEL") {
                    onCancelTap()
                    resetTextFields()
                }.padding(10).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }.padding(20).background(Color(UIColor.lightGray)).clipShape(RoundedRectangle(cornerRadius: 20)).padding()
    }
    private func resetTextFields() {
        isShown.toggle()
        newItemData = Item(name: "", type: "", itemDescription: "", creationDate: Date.now)
    }
}

#Preview {
    ItemSheet(newItemData: .constant(Item(name: "", type: "", itemDescription: "", creationDate: Date.now)),
              isShown: .constant(true),
              onSaveTap: {},
              onCancelTap: {})
}

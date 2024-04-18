//
//  ItemsListSheet.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import SwiftUI

struct ItemsListSheet: View {
        @State var items: [Item]
        @Binding var isShown: Bool
        @State var selection: Set<Item> = []
        var onSaveTap: (_ subItems: Set<Item>) -> Void
        var onCancelTap: () -> Void
        var body: some View {
            VStack {
                List(items) { item in
                    ItemCellSelection(item: item, selection: $selection)
                }.background(Color(UIColor.lightGray)).listRowSpacing(20)
                HStack(spacing: 20) {
                    Button("SAVE") {
                        isShown.toggle()
                        onSaveTap(selection)
                    }.padding(10).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 10))
                    Button("CANCEL") {
                        resetTextFields()
                        isShown.toggle()
                        onCancelTap()
                    }.padding(10).background(Color.black).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }.padding(20).background(Color(UIColor.lightGray)).clipShape(RoundedRectangle(cornerRadius: 20)).padding()
        }
        private func resetTextFields() {
            items = [Item(name: "", type: "", objectDescription: "", creationDate: Date.now)]
        }
}

#Preview {
    ItemsListSheet(
        items: [], isShown: .constant(true),
              onSaveTap: {_ in},
              onCancelTap: {})
}

//
//  EditRelationItemView.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import SwiftUI
struct EditRelationItemView: View {
    @State var item: SubRelatedItem = SubRelatedItem(name: "", type: "", itemDescription: "", creationDate: Date.now)
    @State private var path = NavigationPath()
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                PlaceholderTextField(placeholder: "Type", text: $item.type)
                PlaceholderTextField(placeholder: "Name", text: $item.name)
                PlaceholderTextField(placeholder: "Description", text: $item.objectDescription)
                Spacer()
            }
        }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edit Relation Object")
            .background(Color(UIColor.lightGray))
    }
}

#Preview {
    EditRelationItemView()
}
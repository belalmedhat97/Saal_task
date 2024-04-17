//
//  ItemListView.swift
//  Saal_Task
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI
import SwiftData

struct ItemListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var listItems: [Item]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText)
                    .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    ItemListView().modelContainer(for: Item.self, inMemory: true)
}

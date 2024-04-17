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
            ZStack {
                VStack {
                    SearchBar(text: $searchText)
                        .padding(.horizontal)
                    List {
                        ForEach(listItems.filter {
                            self.searchText.isEmpty || $0.name.localizedStandardContains(self.searchText)
                        }) { item in
                            
                        }
                    }.background(Color(UIColor.lightGray))
                }
                FloatingAddButton {
                    print("")
                }
            }.navigationBarTitleDisplayMode(.inline).navigationTitle("Objects")

        }
    }
}

#Preview {
    ItemListView().modelContainer(for: Item.self, inMemory: true)
}

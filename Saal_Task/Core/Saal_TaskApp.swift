//
//  Saal_TaskApp.swift
//  Saal_Task
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI
import SwiftData

@main
struct Saal_TaskApp: App {
    let modelContainer: ModelContainer

    init() {

        do {
            modelContainer = try ModelContainer(for: Item.self)
            modelContainer.mainContext.autosaveEnabled = false
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    var body: some Scene {
        WindowGroup {
            ItemListView(viewModel: ItemListViewModel(dataManagerService: SwiftDataManager()))
        }.modelContainer(modelContainer)
    }
}

//
//  SwiftDataManagerTests.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import XCTest
import SwiftData

@testable import SaalTask
final class SwiftDataManagerTests: XCTestCase {
    var swiftDataDependency: DataManagerProtocol?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // inject container that will be saved in memory for unit testing
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Item.self, configurations: config)
        swiftDataDependency = SwiftDataManager(inMemoryContainer: container)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        swiftDataDependency = nil
    }
    func testAppStartsEmpty() throws {
        let sut = try swiftDataDependency?.fetchItems()
        XCTAssertEqual(sut?.count, 0, "There should be 0 Items when the app is first launched.")
    }
    func testCreateItem() {
        let item = Item(name: "Test Item",
                        type: "Test Type",
                        objectDescription: "Test Description",
                        creationDate: Date())
        XCTAssertNoThrow(try swiftDataDependency?.createItem(item))
        XCTAssertEqual(try swiftDataDependency?.fetchItems()?[0].name,
                       "Test Item", "name exist after creating in memory")
        // Additional assertions to verify item creation if needed
    }
    func testFetchItem() {
        XCTAssertNoThrow(try swiftDataDependency?.fetchItems())
        // Additional assertions to verify fetched items if needed
    }
    func testUpdateItem() {
        testCreateItem()
        let updatedItem = Item(name: "Test Item",
                               type: "updated Type",
                               objectDescription: "Test Description",
                               creationDate: Date())
        XCTAssertNoThrow(try swiftDataDependency?.updateItem(oldItem: (swiftDataDependency?.fetchItems()?[0])!,
                                                             newItem: updatedItem))
        XCTAssertEqual(try swiftDataDependency?.fetchItems()?[0].type,
                       "updated Type")
        // Additional assertions to verify item update if needed
    }
    func testDeleteItem() {
        testCreateItem()
        XCTAssertEqual(try swiftDataDependency?.fetchItems()?.count, 1, "item created in memory")
        XCTAssertNoThrow(try swiftDataDependency?.deleteItem((swiftDataDependency?.fetchItems()?[0])!))
        XCTAssertEqual(try swiftDataDependency?.fetchItems()?.count, 0, "item delted from the memory")
        // Additional assertions to verify item deletion if needed
    }
    func testSearchItem() {
        let itemName = "Test Item"
        testCreateItem()
        XCTAssertEqual(try swiftDataDependency?.searchItem(with: itemName)?[0].type, "Test Type")
        // Additional assertions to verify search results if needed
    }
}

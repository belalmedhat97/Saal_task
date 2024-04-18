//
//  ItemListViewModelTests.swift
//  SaalTaskTests
//
//  Created by belal medhat on 18/04/2024.
//

import XCTest
import SwiftData
@testable import SaalTask
final class ItemListViewModelTests: XCTestCase {

    var viewModel: (any ItemListViewModelProtocols)?
    var mockDataManager: MockDataManager!
        override func setUp() {
            super.setUp()
            mockDataManager = MockDataManager()
            viewModel = ItemListViewModel(dataManagerService: mockDataManager)
        }
        override func tearDown() {
            viewModel = nil
            mockDataManager = nil
            super.tearDown()
        }
    func testCreateObject_Success() {
            // Given
            let item = Item(name: "Test Item",
                            type: "Test Type",
                            objectDescription: "Test Description",
                            creationDate: Date())
            // When
            viewModel?.createObject(item)
            // Then
        // already have 10 stubs and added a new one in creation total is 11
        XCTAssertEqual(viewModel?.listOfItems?.count, 11)
        XCTAssertEqual(viewModel?.vmError.show, false)
        }
        func testCreateObject_Failure() {
            // Given
            mockDataManager.shouldThrowError = true
            let item = Item(name: "Test Item",
                            type: "Test Type",
                            objectDescription: "Test Description",
                            creationDate: Date())
            // When
            viewModel?.createObject(item)
            // Then
            XCTAssertEqual(viewModel?.listOfItems?.count, 10)
            XCTAssertEqual(viewModel?.vmError.show, true)
        }
        func testFetchItems_Success() {
            // Given
            // When
            viewModel?.fetchItems()
            // Then
            XCTAssertEqual(viewModel?.listOfItems?.count, 10)
            XCTAssertEqual(viewModel?.vmError.show, false)
        }
        func testFetchItems_Failure() {
            // Given
            mockDataManager.shouldThrowError = true
            // When
            viewModel?.fetchItems()
            // Then
            XCTAssertEqual(viewModel?.listOfItems?.count, 10)
            XCTAssertEqual(viewModel?.vmError.show, true)
        }
        func testDeleteItem_Success() {
            // Given
            let itemToDelete = Item(name: "Item 5",
                                    type: "type 5",
                                    objectDescription: "Description for Item 5",
                                    creationDate: Date())
            // When
            viewModel?.deleteItem(itemToDelete)
            // Then
            XCTAssertEqual(viewModel?.listOfItems?.count, 9)
            XCTAssertEqual(viewModel?.vmError.show, false)
        }
        func testDeleteItem_Failure() {
            // Given
            mockDataManager.shouldThrowError = true
            let itemToDelete = Item(name: "Item 5",
                                    type: "Type 5",
                                    objectDescription: "Description for Item 5",
                                    creationDate: Date())
            // When
            viewModel?.deleteItem(itemToDelete)
            // Then
            XCTAssertEqual(viewModel?.listOfItems?.count, 10)
            XCTAssertEqual(viewModel?.vmError.show, true)
        }
        func testSearchItem_Success() {
            // Given
            let searchName = "Item 4"
            // When
            viewModel?.searchItem(searchName)
            // Then
            XCTAssertEqual(viewModel?.listOfItems?.count, 1)
            XCTAssertEqual(viewModel?.vmError.show, false)
        }
        func testSearchItem_Failure() {
            // Given
            mockDataManager.shouldThrowError = true
            let searchName = "Non-existing Item"
            // When
            viewModel?.searchItem(searchName)
            // Then
            XCTAssertEqual(viewModel?.listOfItems?.count, 10)
            XCTAssertEqual(viewModel?.vmError.show, true)
        }
    }

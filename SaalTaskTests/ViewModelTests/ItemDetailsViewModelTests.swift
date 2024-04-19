//
//  ItemDetailsViewModelTests.swift
//  SaalTaskTests
//
//  Created by belal medhat on 18/04/2024.
//

import XCTest
import SwiftData
@testable import SaalTask
final class ItemDetailsViewModelTests: XCTestCase {

    var viewModel: (any ItemDetailsViewModelProtocols)?
    var mockDataManager: MockDataManager!
        override func setUp() {
            super.setUp()
            mockDataManager = MockDataManager()
            viewModel = ItemDetailsViewModel(dataManagerService: mockDataManager)
        }
        override func tearDown() {
            viewModel = nil
            mockDataManager = nil
            super.tearDown()
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
//            // Given
//            let superItem = (viewModel?.listOfItems?[3])!
//            let itemInRelationToDeleted = SubRelatedItem(name: "SubItem 2",
//                                    type: "SubItemtype 2",
//                                    objectDescription: "Description for SubItem 2",
//                                    creationDate: Date())
//            // When
//            viewModel?.deleteItem(superItem, itemInRelation: itemInRelationToDeleted)
//            // Then
//            var itemWasDeleted = true
//            if let itemExist = viewModel?.listOfItems?[3].subItem?.contains(where: {$0.name == "SubItem 2"}) {
//                itemWasDeleted = false
//            }
//            XCTAssertTrue(itemWasDeleted)
//            XCTAssertEqual(viewModel?.vmError.show, false)
        }
        func testDeleteItem_Failure() {
//            // Given
//            mockDataManager.shouldThrowError = true
//            let superItem = (viewModel?.listOfItems?[3])!
//            let itemInRelationToDeleted = SubRelatedItem(name: "SubItem 5",
//                                    type: "SubItemtype 2",
//                                    objectDescription: "Description for SubItem 2",
//                                    creationDate: Date())
//            // When
//            viewModel?.deleteItem(superItem, itemInRelation: itemInRelationToDeleted)
//            // Then
//            var itemWasDeleted = true
//            if let itemExist = viewModel?.listOfItems?[3].subItem?.contains(where: {$0.name == "SubItem 2"}) {
//                itemWasDeleted = false
//            }
//            XCTAssertFalse(itemWasDeleted)
//            XCTAssertEqual(viewModel?.vmError.show, true)
        }
        func testUpdateItem_Success() {
//        // Given
//        let oldItem = (viewModel?.listOfItems?[3])!
//        let newItem1 = Item(name: "SubItem 5",
//                            type: "SubItemtype 5",
//                            objectDescription: "Description for SubItem 5",
//                            creationDate: Date())
//        let newItem2 = Item(name: "SubItem 6",
//                            type: "SubItemtype 6",
//                            objectDescription: "Description for SubItem 6",
//                            creationDate: Date())
//        // When
//        viewModel?.updateItem(oldItem: oldItem, with: [newItem1, newItem2])
//        // Then
//        XCTAssertEqual(oldItem.subItem?.count, 2)
//            XCTAssertEqual(oldItem.subItem?[0].name, newItem1.name)
//            XCTAssertEqual(oldItem.subItem?[1].name, newItem2.name)
    }
    }

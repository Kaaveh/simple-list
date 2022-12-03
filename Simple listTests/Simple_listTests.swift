//
//  Simple_listTests.swift
//  Simple listTests
//
//  Created by Kaaveh Mohamedi on 12/2/22.
//

import XCTest
@testable import Simple_list

class Simple_listTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyState() throws {
        let viewModel = ListViewModel.emptyState()
        XCTAssertTrue(viewModel.items.isEmpty, "sad")
    }
    
    func testWithSampleState() throws {
        let viewModel = ListViewModel.withSampleState()
        XCTAssertTrue(!viewModel.items.isEmpty)
    }
    
    func testAddItem() throws {
        let viewModel = ListViewModel.emptyState()
        viewModel.addItem()
        XCTAssertTrue(viewModel.items.count == 1)
    }

}

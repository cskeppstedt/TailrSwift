//
//  ViewControllerTests.swift
//  TailrSwift
//
//  Created by Christoffer Skeppstedt on 09/06/14.
//  Copyright (c) 2014 chsk. All rights reserved.
//

import XCTest
@testable import TailrSwift

class ViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTranslateStateIndex() {
        let viewController = ViewController()
        let (rowIndex, colIndex) = viewController.translateStateIndex(16)
        
        // Assumes columns = 10, and rows > 1
        XCTAssertEqual(rowIndex, 1, "Should be row index 1")
        XCTAssertEqual(colIndex, 7, "Should be col index 7")
    }
}

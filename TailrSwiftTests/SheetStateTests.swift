//
//  Rava.swift
//  TailrSwift
//
//  Created by Christoffer Skeppstedt on 09/06/14.
//  Copyright (c) 2014 chsk. All rights reserved.
//

import XCTest
import TailrSwift

class SheetStateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConstructorSetsRowsAndColumns() {
        // This is an example of a functional test case.
        let sheetState = SheetState(rows: 7, columns: 13)
        
        XCTAssertEqualObjects(sheetState.rows, 7)
        XCTAssertEqualObjects(sheetState.columns, 13)
    }
    
    func testAllCellsAreDeactivatedByDefault() {
        // This is an example of a functional test case.
        let sheetState = SheetState(rows: 7, columns: 13)
        
        var anyActive = false
        for rowIndex in 0 ... sheetState.rows - 1 {
            for columnIndex in 0 ... sheetState.columns - 1 {
                anyActive = anyActive || sheetState.isActive(rowIndex, columnIndex: columnIndex)
            }
        }
        
        XCTAssertFalse(anyActive, "There should not be any active cells by default")
    }
    
    func testActivateCell() {
        // This is an example of a functional test case.
        let sheetState = SheetState(rows: 4, columns: 4)
        sheetState.activate(2, columnIndex: 3)
        
        XCTAssertTrue(sheetState.isActive(2, columnIndex: 3), "(2,3) should be active")
    }
    
    func testDeactivateCell() {
        let sheetState = SheetState(rows: 4, columns: 4)
        sheetState.activate(2, columnIndex: 3)
        sheetState.deactivate(2, columnIndex: 3)
        
        XCTAssertFalse(sheetState.isActive(2, columnIndex: 3), "(2,3) should not be active")
    }
    
    func testToggleCell() {
        let sheetState = SheetState(rows: 4, columns: 4)
        sheetState.toggle(2, columnIndex: 3)
        
        XCTAssertTrue(sheetState.isActive(2, columnIndex: 3), "(2,3) should be active")

        sheetState.toggle(2, columnIndex: 3)
        XCTAssertFalse(sheetState.isActive(2, columnIndex: 3), "(2,3) should not be active")
    }
}

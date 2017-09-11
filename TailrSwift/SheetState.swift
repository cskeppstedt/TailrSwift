//
//  SheetState.swift
//  TailrSwift
//
//  Created by Christoffer Skeppstedt on 08/06/14.
//  Copyright (c) 2014 chsk. All rights reserved.
//

class SheetState {
    var sheet = Array<Array<Bool>>()
    let columns:Int!
    let rows:Int!
    
    var totalCells:Int {
        get { return columns * rows }
    }
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        
        for _ in 0..<rows {
            sheet.append(Array(repeating: Bool(), count: columns))
        }
    }
    
    func isActive(_ rowIndex: Int, columnIndex: Int) -> Bool {
        assert(rowIndex < self.rows && rowIndex >= 0, "Row index out of bounds")
        assert(columnIndex < self.columns && columnIndex >= 0, "Column index out of bounds")
        
        return self.sheet[rowIndex][columnIndex] == true
    }
    
    func activate(_ rowIndex: Int, columnIndex: Int) {
        assert(rowIndex < self.rows && rowIndex >= 0, "Row index out of bounds")
        assert(columnIndex < self.columns && columnIndex >= 0, "Column index out of bounds")
        
        self.sheet[rowIndex][columnIndex] = true
    }
    
    func deactivate(_ rowIndex: Int, columnIndex: Int) {
        assert(rowIndex < self.rows && rowIndex >= 0, "Row index out of bounds")
        assert(columnIndex < self.columns && columnIndex >= 0, "Column index out of bounds")
        
        self.sheet[rowIndex][columnIndex] = false
    }
    
    func toggle(_ rowIndex: Int, columnIndex: Int) {
        assert(rowIndex < self.rows && rowIndex >= 0, "Row index out of bounds")
        assert(columnIndex < self.columns && columnIndex >= 0, "Column index out of bounds")
        
        self.sheet[rowIndex][columnIndex] = !self.sheet[rowIndex][columnIndex]
    }
}

//
//  ViewController.swift
//  TailrSwift
//
//  Created by Christoffer Skeppstedt on 08/06/14.
//  Copyright (c) 2014 chsk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var collectionView:UICollectionView!
    
    let cellIdentifier:NSString = "SHEET_GRID_CELL"
    let sheetState = SheetState(rows: 10, columns: 9)
    var collectionViewLayout:UICollectionViewLayout = MyLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        sheetState.activate(3, columnIndex: 5)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionViewLayout.invalidateLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleCell(itemIndex: Int) {
        let (rowIndex, columnIndex) = self.translateStateIndex(itemIndex)
        sheetState.toggle(rowIndex, columnIndex: columnIndex)
        self.collectionView.reloadData()
    }
    
    func translateStateIndex(itemIndex: Int) -> (Int, Int) {
        let rowIndex    = itemIndex / sheetState.columns
        let columnIndex = itemIndex % sheetState.columns
        
        return (rowIndex, columnIndex)
    }

    //UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return sheetState.totalCells
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        
        let (rowIndex, columnIndex) = self.translateStateIndex(indexPath.item)
        
        if sheetState.isActive(rowIndex, columnIndex: columnIndex) {
            cell.backgroundColor = UIColor.orangeColor()	
        } else {
            cell.backgroundColor = UIColor(red: 240/255.0, green: 230/255.0, blue: 210/255.0, alpha: 1.0)
        }
        
        return cell
    }
    
    //UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        self.toggleCell(indexPath.item)
    }
    
    func collectionView(collectionView: UICollectionView!, didDeselectItemAtIndexPath indexPath: NSIndexPath!) {
        self.toggleCell(indexPath.item)
    }
}


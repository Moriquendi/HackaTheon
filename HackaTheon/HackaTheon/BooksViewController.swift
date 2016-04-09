//
//  BooksViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController,
UICollectionViewDataSource,
UICollectionViewDelegate {
    
    let SegueListDetails = "kListDetailsSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView,
                        didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(SegueListDetails, sender: ["item" : indexPath])
    }
    

    // MARK: UIViewController
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == SegueListDetails) {
            let details = sender as! Dictionary<String, AnyObject>
            print(details)
        }
    }
    
}


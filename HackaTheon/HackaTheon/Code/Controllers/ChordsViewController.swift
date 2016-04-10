//
//  ChordsViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class ChordsViewController: UIViewController,
UITableViewDataSource,
UITableViewDelegate {

    var chords: Array<Chord> = []
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! ChordTableViewCell
        
        let chord = chords[indexPath.row]
        cell.chordImageView.image = chord.image
        cell.chordNameLabel.text = chord.name
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
}

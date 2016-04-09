//
//  ListViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,
UITableViewDataSource,
UITableViewDelegate {

    // MARK: UIViewController
    var list: List?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var songsCountLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    
    let kSongSegue = "kSongSegue"
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = list?.title
        self.titleLabel.text = list!.title
        self.songsCountLabel.text = String(list!.songs.count)
        self.headerImageView.image = list?.image
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRowAtIndexPath(indexPath, animated: animated)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == kSongSegue) {
            let songVC = segue.destinationViewController as! SongViewController
            
            let song = sender as! Song
            songVC.song = song
        }
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list!.songs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SongTableViewCell
        
        let song = self.list!.songs[indexPath.row]
        cell.titleLabel.text = song.title
        cell.synopsisLabel.text = song.text
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let song = list!.songs[indexPath.row]
        self.performSegueWithIdentifier("kSongSegue", sender: song)
    }
    
    // MARK: ListViewController
    
    @IBAction func didTapCloseButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

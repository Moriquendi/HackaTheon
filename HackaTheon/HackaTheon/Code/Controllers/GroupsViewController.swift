//
//  GroupsViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 10/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

protocol GroupsPickerDelegate {
    func didPickGroup(group: Group)
}

class GroupsViewController: UIViewController {

    var groups: [Group] = []
    var delegate: GroupsPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapClouse(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! GroupTableViewCell
        
        let group = self.groups[indexPath.row]
//        cell.avatarImageView.image = 
//        cell.nameLabel.text = 
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let group = groups[indexPath.row]
        
        delegate?.didPickGroup(group)
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}

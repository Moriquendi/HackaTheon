//
//  ListViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    // MARK: UIViewController
    var list: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = list?.title
    }

    
}

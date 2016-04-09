//
//  ListCollectionViewCell.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }
    
    // MARK: ListCollectionViewCell
    
    func initialize() {
        containerView.layer.cornerRadius = 7
        
        self.layer.shadowColor = UIColor(white: 0.1, alpha: 1).CGColor
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }
    
}

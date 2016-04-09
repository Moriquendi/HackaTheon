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
    @IBOutlet weak var subCardContainer: UIView!
    
    // MARK: UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }
    
    // MARK: ListCollectionViewCell
    
    func initialize() {
        imageView.layer.cornerRadius = 7
        subCardContainer.layer.cornerRadius = 7
        
        self.layer.shadowColor = UIColor(white: 0.1, alpha: 1).CGColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        
        subCardContainer.layer.shadowColor = UIColor(white: 0.1, alpha: 1).CGColor
        subCardContainer.layer.shadowRadius = 6
        subCardContainer.layer.shadowOpacity = 1
        subCardContainer.layer.masksToBounds = false
    }
    
}

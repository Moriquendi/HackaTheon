//
//  ChordTableViewCell.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class ChordTableViewCell: UITableViewCell {

    @IBOutlet weak var chordImageView: UIImageView!
    @IBOutlet weak var chordNameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playButton.layer.borderColor = self.tintColor.CGColor
        playButton.layer.borderWidth = 0.5
        playButton.layer.cornerRadius = playButton.bounds.size.width/2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

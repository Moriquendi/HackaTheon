//
//  KaraokeViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit
import LTMorphingLabel

class KaraokeViewController: UIViewController {
    
    @IBOutlet weak var textLabel: LTMorphingLabel!
    
    var song: Song?
    var songTextLines: Array<String> = []
    var timer: NSTimer?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textLabel.text = "\"\(song!.title!)\""
        self.textLabel.morphingEffect = LTMorphingEffect.Fall
        songTextLines = song!.text!.componentsSeparatedByString("\n").filter({ (line) -> Bool in
            if (line.characters.count == 0) {
                return false
            }
            return true
        })
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.5, target: self, selector: #selector(KaraokeViewController.changeText), userInfo: self, repeats: true)
    }
    
    // MARK: KaraokeViewController
    
    var index = 0
    func changeText() {
        self.textLabel.text = songTextLines[index % songTextLines.count]
        index += 1
    }

    @IBAction func didTapEndButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

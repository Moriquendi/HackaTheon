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
    var timer: NSTimer?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.textLabel.morphingEffect = LTMorphingEffect.Fall
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(KaraokeViewController.changeText), userInfo: self, repeats: true)
    }
    
    // MARK: KaraokeViewController
    
    var index = 0
    func changeText() {
        
        let text = ["Nazywam sie Michal",
                    "Na nazwisko Smialko",
                    "Jestesmy na HackTheonie",
                    "Pozdrawiamy wszystkich goraco",
                    "Hej hej i pa!"]
        
        self.textLabel.text = text[index % 5]
        index += 1
    }

    @IBAction func didTapEndButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

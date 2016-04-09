//
//  SongViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class SongViewController: UIViewController,
DSFacialDetectorDelegate {

    let facialGesturesDetector = DSFacialGesturesDetector()
    @IBOutlet weak var textView: UITextView!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        facialGesturesDetector.delegate = self
        facialGesturesDetector.cameraPreviewView = nil
        var error: NSError? = nil
        facialGesturesDetector.startDetection(&error)
    }

    // MARK: DSFacialDetectorDelegate

    func didRegisterFacialGesutreOfType(facialGestureType: GestureType,
                                        withLastImage lastImage: UIImage!) {
    }
    
    var lastScrollDate = NSDate()
    func didUpdateProgress(progress: Float,
                           forType facialGestureType: GestureType) {
        
        switch facialGestureType {
        case .LeftBlink, .RightBlink:
            if (lastScrollDate.timeIntervalSinceNow < -3.0 &&
                progress > 0.5) {
                print("Yep \(progress) - \(facialGestureType)")
                
                self.textView.setContentOffset(CGPoint(x: self.textView.contentOffset.x,
                    y: self.textView.contentOffset.y + self.textView.bounds.size.height/2), animated: true)
                
                lastScrollDate = NSDate()
            }
            break
        default: break
            
        }
    }
    
}

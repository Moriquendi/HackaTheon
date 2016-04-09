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

    var song: Song?
    let facialGesturesDetector = DSFacialGesturesDetector()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var additionalMenuOptions: UIView!
    @IBOutlet var cameraPreviewView: UIView!
    
    var faceGesturesEnabled = false {
        didSet {
            cameraPreviewView.hidden = !faceGesturesEnabled
        }
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        facialGesturesDetector.delegate = self
        facialGesturesDetector.cameraPreviewView = self.cameraPreviewView
        var error: NSError? = nil
        facialGesturesDetector.startDetection(&error)
        
        self.cameraPreviewView.hidden = true
        self.textView.addSubview(self.additionalMenuOptions)
        self.textView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        
        self.textView.text = song?.text
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.additionalMenuOptions.frame = CGRectMake(0, -100, self.textView.bounds.size.width, 100)
    }

    // MARK:
    
    @IBAction func didTapToggleFaceGestures(sender: AnyObject) {
        self.faceGesturesEnabled = !self.faceGesturesEnabled
    }
    
    // MARK: DSFacialDetectorDelegate

    func didRegisterFacialGesutreOfType(facialGestureType: GestureType,
                                        withLastImage lastImage: UIImage!) {
    }
    
    var lastScrollDate = NSDate()
    func didUpdateProgress(progress: Float,
                           forType facialGestureType: GestureType) {
        
        if (!faceGesturesEnabled) {
            return
        }
        
        switch facialGestureType {
        case .LeftBlink, .RightBlink:
            if (lastScrollDate.timeIntervalSinceNow < -2.0 &&
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

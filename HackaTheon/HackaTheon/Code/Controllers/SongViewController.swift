//
//  SongViewController.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit
import AVFoundation

class SongViewController: UIViewController,
DSFacialDetectorDelegate {

    var song: Song?
    let facialGesturesDetector = DSFacialGesturesDetector()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var additionalMenuOptions: UIView!
    @IBOutlet var cameraPreviewView: UIView!
    
    var player: AVPlayer?
    
    
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
        self.textView.contentInset = UIEdgeInsetsMake(70, 0, 0, 0)
        
        self.textView.text = song?.text
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.additionalMenuOptions.frame = CGRectMake(0, -70, self.textView.bounds.size.width, 70)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let karaokeVC = segue.destinationViewController as? KaraokeViewController {
            karaokeVC.song = song
        }
        else if let chordsVC = segue.destinationViewController as? ChordsViewController {
            let ADur = Chord()
            ADur.name = "A"
            ADur.image = UIImage(named: "ADur")
            
            let EDur = Chord()
            EDur.name = "E"
            EDur.image = UIImage(named: "EDur")
            
            let DDur = Chord()
            DDur.name = "D"
            DDur.image = UIImage(named: "DDur")
            
            let CDur = Chord()
            CDur.name = "C"
            CDur.image = UIImage(named: "CDur")
            
            let GDur = Chord()
            GDur.name = "G"
            GDur.image = UIImage(named: "GDur")
            
            let chords = [ADur, EDur, DDur, CDur, GDur]
            chordsVC.chords = chords
        }
    }
    
    // MARK: SongViewController
    
    @IBAction func playSong(sender: AnyObject) {
        if (player == nil) {
            let URL = NSURL(string: "https://dl.dropboxusercontent.com/u/24532134/tmpSong.mp3")!
            let playerItem = AVPlayerItem(URL: URL)
            player = AVPlayer(playerItem: playerItem)
        }
        
        if (player?.rate > 0) {
            player?.pause()
        }
        else {
            player?.play()
        }
    }
    
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

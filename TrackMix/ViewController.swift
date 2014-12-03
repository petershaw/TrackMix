//
//  ViewController.swift
//  TrackMix
//
//  Created by Kris Wolff on 03/12/14.
//  Copyright (c) 2014 de.petershaw. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let track = Track()
    var lastVolume: Float = 0.0
    
    
    @IBOutlet weak var volumeText: NSTextField!
    @IBOutlet weak var volumeSlider: NSSlider!
    @IBOutlet weak var onAir: NSButton!
    
    @IBAction func onAirAction(sender: NSButton) {
        if sender.integerValue == 0 {
            lastVolume = track.volume
            track.volume = 0.0
        } else {
            track.volume = lastVolume
        }
        updateUserInterface()
    }
    
    @IBAction func takeFloatValueForVolumeFrom(sender: AnyObject) {
        let newValue = sender.floatValue
        track.volume = newValue
        updateUserInterface()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func updateUserInterface(){
        let volume: Float = track.volume
        volumeText.floatValue = volume
        volumeSlider.floatValue = volume
        if volume == 0 {
            onAir.integerValue = 0
        } else {
            onAir.integerValue = 1
        }
    }


}


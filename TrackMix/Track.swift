//
//  Track.swift
//  TrackMix
//
//  Created by Kris Wolff on 03/12/14.
//  Copyright (c) 2014 de.petershaw. All rights reserved.
//

import Foundation
import AudioToolbox

class Track {
    var volume: Float = 0.0 {
        willSet {
            passValueToSystemVolume(newValue)
        }
    }
    
    init(){
        self.volume = 0.0
    }
    
    func passValueToSystemVolume(value: Float){
        //AudioQueueSetParameter(AudioQueueRef, kAudioQueueParam_Volume, 0.5);

    }
    
}
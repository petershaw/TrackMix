//
//  Track.swift
//  TrackMix
//
//  Created by Kris Wolff on 03/12/14.
//  Copyright (c) 2014 de.petershaw. All rights reserved.
//

import Foundation

class Track {
    private var _volume: Float = 0.0
    var volume: Float {
        get {
            return _volume
        }
        set {
            _volume = newValue
        }
    }
    
    init(){
        self.volume = 0.0
    }
    
}
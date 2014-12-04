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
        var defaultOutputDeviceID = AudioDeviceID(0)
        var defaultOutputDeviceIDSize = UInt32(sizeofValue(defaultOutputDeviceID))
        
        var getDefaultOutputDevicePropertyAddress = AudioObjectPropertyAddress(
            mSelector: AudioObjectPropertySelector(kAudioHardwarePropertyDefaultOutputDevice),
            mScope: AudioObjectPropertyScope(kAudioObjectPropertyScopeGlobal),
            mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementMaster))
        
        let status1 = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &getDefaultOutputDevicePropertyAddress,
            0,
            nil,
            &defaultOutputDeviceIDSize,
            &defaultOutputDeviceID)

        // Set volume on default output device:
        var volume = Float32(value / 10) // 0.0 ... 1.0
        var volumeSize = UInt32(sizeofValue(volume))
        
        var volumePropertyAddress = AudioObjectPropertyAddress(
            mSelector: AudioObjectPropertySelector(kAudioHardwareServiceDeviceProperty_VirtualMasterVolume),
            mScope: AudioObjectPropertyScope(kAudioDevicePropertyScopeOutput),
            mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementMaster))
        
        let status2 = AudioHardwareServiceSetPropertyData(
            defaultOutputDeviceID,
            &volumePropertyAddress,
            0,
            nil,
            volumeSize,
            &volume)
    }
    
}
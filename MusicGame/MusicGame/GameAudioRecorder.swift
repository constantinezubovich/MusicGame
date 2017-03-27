//
//  GameAudioRecorder.swift
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation
import AVFoundation

class GameAudioRecorder: NSObject {
    
    fileprivate var recorder: AVAudioRecorder?
    
    init(url: URL) {
        super.init()
        
        let settings: [String: Any] = [AVFormatIDKey: kAudioFormatAppleLossless,
                                       AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
                                       AVEncoderBitRateKey: 320000,
                                       AVNumberOfChannelsKey: 2,
                                       AVSampleRateKey: 44100.0]
        
        do {
            recorder = try AVAudioRecorder(url: url, settings: settings)
            recorder?.delegate = self
            recorder?.prepareToRecord()
        } catch {
            print(error)
        }
        
    }
    
    func record() {
        recorder?.record()
    }
    
    func stop() {
        recorder?.stop()
    }
    
    
}

extension GameAudioRecorder: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("audioRecorderDidFinishRecording")
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        if error != nil {
            print(error!)
        }
    }
    
}


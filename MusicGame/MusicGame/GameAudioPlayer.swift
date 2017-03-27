//
//  GameAudioPlayer.swift
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation
import AVFoundation

class GameAudioPlayer: NSObject {
    
    fileprivate var player: AVAudioPlayer?
    fileprivate var reader : FileReader?
    fileprivate var output : Output
    fileprivate var url: URL
    
    init(url: URL) {
        self.url = url
        output = Output()
    }
    
    func play() {
        preparePlayer()
        player?.play()
    }
    
    func reversePlay() {
        prepareReversePlayer()
        output.startUnit()
    }
}

extension GameAudioPlayer: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("audioPlayerDidFinishPlaying")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if error != nil {
            print(error!)
        }
    }
}

extension GameAudioPlayer: OutputDataSource {
    
    func readFrames(_ frames: UInt32, audioBufferList: UnsafeMutablePointer<AudioBufferList>, bufferSize: UnsafeMutablePointer<UInt32>) {
        if reader != nil {
            reader?.readFrames(frames, audioBufferList: audioBufferList, bufferSize: bufferSize)
        }
    }
    
}

extension GameAudioPlayer: FileReaderDelegate {
    
    func audioFile(_ audioFile: FileReader!, updatedPosition framePosition: Int64) {
        if framePosition < 0 {
            output.stopUnit()
        }
    }
    
}

private extension GameAudioPlayer {
    
    func preparePlayer() {
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.volume = 1.0
        } catch {
            print(error)
        }
        
    }
    
    func prepareReversePlayer() {
        if (reader != nil) {
            reader = nil
        }
        reader = FileReader(fileURL: url)
        reader?.delegate = self
        output.outputDataSource = self
    }
    
}


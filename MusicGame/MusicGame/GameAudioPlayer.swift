//
//  GameAudioPlayer.swift
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation
import AVFoundation

protocol GameAudioPlayerDelegate: class {
    func audioPlayerDidFinishPlaying()
}

class GameAudioPlayer: NSObject {
    
    weak var delegate: GameAudioPlayerDelegate? 
    
    fileprivate var player: AVAudioPlayer?
    fileprivate var reader : FileReader?
    fileprivate var output : Output?
    fileprivate var url: URL
    
    init(url: URL) {
        self.url = url
        output = Output()
    }
    
    init(urlString: String) {
        url = URL(string: urlString)!
        do {
            let data: Data = try Data(contentsOf: url)
            player = try AVAudioPlayer(data: data)
        } catch {
            print(error)
        }
        
    }
    
    func play() {
        preparePlayer()
        player?.play()
    }
    
    func stop() {
        player?.stop()
    }
    
    func reversePlay() {
        prepareReversePlayer()
        output?.startUnit()
    }
}

extension GameAudioPlayer: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("audioPlayerDidFinishPlaying")
        self.delegate?.audioPlayerDidFinishPlaying()
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
            output?.stopUnit()
        }
    }
    
}

private extension GameAudioPlayer {
    
    func preparePlayer() {
        if player == nil {
            do {
                player = try AVAudioPlayer(contentsOf: url)
            } catch {
                print(error)
            }
        }
        
        player?.delegate = self
        player?.volume = 1.0
    }
    
    func prepareReversePlayer() {
        if (reader != nil) {
            reader = nil
        }
        reader = FileReader(fileURL: url)
        reader?.delegate = self
        output?.outputDataSource = self
    }
    
}


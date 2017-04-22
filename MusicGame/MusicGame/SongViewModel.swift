//
//  SongViewModel.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation
import UIKit

protocol SongViewModelDelegate: class {
    func updatePlayButton()
}

class SongViewModel {
    
    weak var delegate:SongViewModelDelegate?
    
    private var song: Song
    
    var isPlaying = false
    
    var nameTitle: String { return song.name }

    var artistTitle: String { return song.artist }
    
    var imageUrl: String { return song.imageUrl }
    
    var audioUrl: String { return song.audioUrl }
    
    var playButtonImage: UIImage {
        if song.isPlaying {
            return #imageLiteral(resourceName: "stop")
        } else {
            return #imageLiteral(resourceName: "play")
        }
    }
    
    init(song: Song) {
        self.song = song
    }
    
    
    func playButtonTapped() {
        NotificationCenter.default.post(name: .GameAudioPlayerWillChangeState, object: nil, userInfo:["song": song])
    }
    
}

extension SongViewModel: GameAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying() {
        self.delegate?.updatePlayButton()
    }
}

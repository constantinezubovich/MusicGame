//
//  SongViewModel.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

struct SongViewModel {
    
    private var song: Song
    
    var nameTitle: String {
        return song.name
    }

    var artistTitle: String {
        return song.artist
    }
    
    var imageUrl: String {
        return song.imageUrl
    }
    
    init(song: Song) {
        self.song = song
    }
    
}

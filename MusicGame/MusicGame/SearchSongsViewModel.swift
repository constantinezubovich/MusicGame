//
//  SearchSongsViewModel.swift
//  MusicGame
//
//  Created by Constantine on 29.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

protocol SearchSongsViewModelDelegate: class {
    func reloadViews()
}

class SearchSongsViewModel {
    
    weak var delegate: SearchSongsViewModelDelegate?
    
    var player: GameAudioPlayer?
    
    private var songs: [Song] = [Song]()
    
    var numberOfRows: Int {
        return songs.count
    }
    
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(changePlayerState(notification:)), name: .GameAudioPlayerWillChangeState, object: nil)
    }
    
    @objc func changePlayerState(notification: Notification) {
        
        guard let userInfo = notification.userInfo, let song = userInfo["song"] as? Song else { return }
        
        if song.isPlaying {
            player?.stop()
        } else {
            player = GameAudioPlayer(urlString: song.audioUrl)
            player?.play()
            for song in songs {
                song.isPlaying = false
            }
            song.isPlaying = true
            delegate?.reloadViews()
        }
        
    }
    
    func searchSongs(searchText: String) {
        
        NetworkDataFetcher.Songs.fetcthSongs(searchText: searchText) { songs in
            self.songs = songs
            self.delegate?.reloadViews()
        }
        
    }
    
    func viewModelForSearchedCell(atIndex index: Int) -> SongViewModel {
        return SongViewModel(song: songs[index])
    }
    
    
}

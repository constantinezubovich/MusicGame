//
//  SongCell.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import UIKit

class SongCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "SongCell"
    
    var player: GameAudioPlayer?
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel: SongViewModel!
    override func prepareForReuse() {
        super.prepareForReuse()
        songLabel.text = nil
        artistLabel.text = nil
        imageView.image = nil
    }
    
    func configure(viewModel: SongViewModel) {
        self.viewModel = viewModel
        
        songLabel.text = viewModel.nameTitle
        artistLabel.text = viewModel.artistTitle
        
        player = GameAudioPlayer(urlString: viewModel.audioUrl)
        
        imageView.loadImageUsingCacheWithUrlString(urlString: viewModel.imageUrl)
    }
    
}

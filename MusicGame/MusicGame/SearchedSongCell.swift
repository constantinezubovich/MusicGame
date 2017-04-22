//
//  SearchedSongCell.swift
//  MusicGame
//
//  Created by Constantine on 29.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import UIKit

class SearchedSongCell: UITableViewCell {

    static let reuseIdentifier: String = "SearchedSongCell"
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    var viewModel: SongViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(viewModel: SongViewModel) {
        self.viewModel = viewModel
        self.viewModel.delegate = self
        songLabel.text = viewModel.nameTitle
        artistLabel.text = viewModel.artistTitle
        playButton.setImage(viewModel.playButtonImage, for: .normal)
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        viewModel.playButtonTapped()
        sender.setImage(viewModel.playButtonImage, for: .normal)
    }
}

extension SearchedSongCell: SongViewModelDelegate {
    func updatePlayButton() {
        self.playButton.setImage(viewModel.playButtonImage, for: .normal)
    }
}

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(viewModel: SongViewModel) {
        songLabel.text = viewModel.nameTitle
        artistLabel.text = viewModel.artistTitle
    }
    
}

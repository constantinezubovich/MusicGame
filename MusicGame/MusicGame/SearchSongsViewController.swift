//
//  SearchSongsViewController.swift
//  MusicGame
//
//  Created by Constantine on 29.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import UIKit

class SearchSongsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SearchSongsViewModel = SearchSongsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.keyboardDismissMode = .onDrag
        viewModel.delegate = self
    }
    
}


extension SearchSongsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchedSongCell.reuseIdentifier, for: indexPath) as! SearchedSongCell
        
        cell.configure(viewModel: viewModel.viewModelForSearchedCell(atIndex: indexPath.row))
        
        return cell
    }
    
}

extension SearchSongsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

extension SearchSongsViewController: SearchSongsViewModelDelegate {
    func reloadViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

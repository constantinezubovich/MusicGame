//
//  ViewController.swift
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //https://itunes.apple.com/ru/rss/topsongs/genre=1157/json
    //https://affiliate.itunes.apple.com/resources/documentation/genre-mapping/
    //https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/#searching
    
    var player: GameAudioPlayer?
    var recorder: GameAudioRecorder?
    
    
    let fileName = "audio.m4a"
    
    let urlString = "/Users/constantine/Documents/test.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recorder = GameAudioRecorder(url: getFileUrl())
        player = GameAudioPlayer(url: getFileUrl())
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCacheDirectory () -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
    
    func getFileUrl() -> URL {
        let path = "\(getCacheDirectory())/\(fileName)"
        let url = URL(fileURLWithPath: path)
        return url
    }
    
}

//MARK: IBActions
extension ViewController {
    
    @IBAction func reversePlayTapped(_ sender: UIButton) {
        //        let url = URL(string: urlString)
        player?.reversePlay()
    }
    
    @IBAction func stopRecordingAction(_ sender: UIButton) {
        print("stopRecordingAction")
        recorder?.stop()
    }
    
    @IBAction func recordTapped(_ sender: Any) {
        print("recordTapped")
        recorder?.record()
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        player?.play()
    }
    
}


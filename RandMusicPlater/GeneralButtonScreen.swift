//
//  GeneralButtonScreen.swift
//  RandMusicPlater
//
//  Created by Carlos Valverde on 2020-04-28.
//  Copyright © 2020 Carlos Valverde. All rights reserved.
//

import UIKit
import MediaPlayer

class GeneralButtonScreen: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        if MPMediaLibrary.authorizationStatus().rawValue != 3 {
            MPMediaLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    self.playGenre(genre: sender.currentTitle!)
                }
            }
        }
        else{
            self.playGenre(genre: sender.currentTitle!)
        }
    }
    
    @IBAction func stopButonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
}


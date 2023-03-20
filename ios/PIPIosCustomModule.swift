//
//  PIPIosCustomModule.swift
//  Tasks
//
//  Created by neoito on 19/03/23.
//

import Foundation
import UIKit
import AVKit

@objc(PIPIosCustomModule)

class PIPIosCustomModule: NSObject {

    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
  
//
//    @objc func viewDidLoad() {
//        self.viewDidLoad()
//
//        // Create the video player and player layer
//        player = AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
//        playerLayer = AVPlayerLayer(player: player)
////        playerLayer.frame = view.bounds
////        view.layer.addSublayer(playerLayer)
//    }
    
    @objc func enablePictureInPictureMode() {
        print("insideeee")
        print("pip", AVPictureInPictureController.isPictureInPictureSupported())
      player = AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
      playerLayer = AVPlayerLayer(player: player)
        // Enable Picture-in-Picture mode
        if AVPictureInPictureController.isPictureInPictureSupported() {
            print("enablr")
            let pictureInPictureController = AVPictureInPictureController(playerLayer: playerLayer)
            pictureInPictureController?.startPictureInPicture()
        }
    }
}

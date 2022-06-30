//
//  AnimationViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 30/11/1443 AH.
//

import UIKit
import AVFoundation
import AVKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "animat", ofType: "mov")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspect
        view.layer.addSublayer(layer)
        player.volume = 0
        player.play()
    }

}

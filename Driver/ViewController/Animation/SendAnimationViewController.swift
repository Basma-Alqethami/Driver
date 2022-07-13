//
//  SendAnimationViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 01/12/1443 AH.
//

import UIKit
import AVFoundation
import AVKit

class SendAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "send", ofType: "mov")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspect
        view.layer.addSublayer(layer)
        player.volume = 0
        player.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }

    @objc func videoDidEnd(notification: NSNotification) {
        print("video ended")
        self.dismiss(animated: true, completion: nil)
        
    }
    deinit {    NotificationCenter.default.removeObserver(self) }
    
}

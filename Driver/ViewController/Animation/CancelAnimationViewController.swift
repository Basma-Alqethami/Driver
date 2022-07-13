//
//  CancelAnimationViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 01/12/1443 AH.
//

import UIKit
import AVFoundation
import AVKit

class CancelAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "cancel", ofType: "mov")!))
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

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavID") as! MainViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
    }
    
    deinit {    NotificationCenter.default.removeObserver(self) }
    
}

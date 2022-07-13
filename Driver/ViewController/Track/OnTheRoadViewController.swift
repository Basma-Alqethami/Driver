//
//  OnTheRoadViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class OnTheRoadViewController: UIViewController {

    var totalTime = 5
    var timer: Timer!
    @IBOutlet weak var stute: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stute.layer.cornerRadius = 10
        //        startOtpTimer()
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func GoTo(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WithCaptainView") as! WithCaptainViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    // func for creat timer
    private func startOtpTimer() {
        self.totalTime = 5
        self.timer = Timer.scheduledTimer(timeInterval: 01.0,
                                          target: self,
                                          selector: #selector(updateTimer),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    // for update timer evry sec and print the time
    @objc func updateTimer() {
        if totalTime != 0 {
            totalTime -= 1  // decrease counter timer
        } else {
            if let timer = self.timer {
                timer.invalidate() //  stop time after 1 min
                self.timer = nil
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WithCaptainView") as! WithCaptainViewController
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavID") as! MainViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
    }

}

//
//  SearchingViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class SearchingViewController: UIViewController {

    var totalTime = 10
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }

    override func viewWillAppear(_ animated: Bool) {
        startOtpTimer()
    }
    
    // func for creat timer
    private func startOtpTimer() {
        self.totalTime = 10
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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "OnTheRoadView") as! OnTheRoadViewController
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: false)
            }
        }
    }
}

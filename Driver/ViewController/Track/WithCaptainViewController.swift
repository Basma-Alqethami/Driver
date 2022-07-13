//
//  WithCaptainViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class WithCaptainViewController: UIViewController {
    
    @IBOutlet weak var stute: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stute.layer.cornerRadius = 10
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavID") as! MainViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
    }
}

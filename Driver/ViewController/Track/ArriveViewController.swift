//
//  ArriveViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class ArriveViewController: UIViewController {

    @IBOutlet weak var buttonView: UIStackView!
    @IBOutlet weak var reviewView: UIStackView!
    @IBOutlet weak var reviewLine: UIImageView!
    @IBOutlet weak var msg: UILabel!
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var viewCard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        viewCard.layer.cornerRadius = 10
        
        guard let rate = UserDefaults.standard.value(forKey: "rate") as? String else {
            reviewView.isHidden = true
            reviewLine.isHidden = true
            buttonView.isHidden = false
             return
         }
        
        reviewView.isHidden = false
        reviewLine.isHidden = false
        buttonView.isHidden = true
        msg.text = rate
        
        guard let locat = UserDefaults.standard.value(forKey: "location") as? String else {
            print("fffffffffffff")
             return
         }
        
        location.text = locat
    }
    @IBAction func back(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavID") as! MainViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
    }
}

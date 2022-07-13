//
//  RateViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    @IBOutlet weak var star6: UIButton!
    @IBOutlet weak var star7: UIButton!
    @IBOutlet weak var star8: UIButton!
    @IBOutlet weak var star9: UIButton!
    @IBOutlet weak var star10: UIButton!
    
    @IBOutlet weak var viewCard: UIView!
    
    @IBOutlet weak var review: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        viewCard.layer.cornerRadius = 15
    }
    
    
    @IBAction func Rate(_ sender: UIButton) {
        
        UserDefaults.standard.setValue(review.text, forKey: "rate")

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ArriveView") as! ArriveViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        UserDefaults.standard.setValue(nil, forKey: "rate")

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ArriveView") as! ArriveViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
    }
    
    
    @IBAction func star1(_ sender: UIButton) {
        star1.tintColor = .yellow
        star2.tintColor = .opaqueSeparator
        star3.tintColor = .opaqueSeparator
        star4.tintColor = .opaqueSeparator
        star5.tintColor = .opaqueSeparator
    }
    @IBAction func star2(_ sender: UIButton) {
        star1.tintColor = .yellow
        star2.tintColor = .yellow
        star3.tintColor = .opaqueSeparator
        star4.tintColor = .opaqueSeparator
        star5.tintColor = .opaqueSeparator
    }
    @IBAction func star3(_ sender: UIButton) {
        star1.tintColor = .yellow
        star2.tintColor = .yellow
        star3.tintColor = .yellow
        star4.tintColor = .opaqueSeparator
        star5.tintColor = .opaqueSeparator
    }
    @IBAction func star4(_ sender: UIButton) {
        star1.tintColor = .yellow
        star2.tintColor = .yellow
        star3.tintColor = .yellow
        star4.tintColor = .yellow
        star5.tintColor = .opaqueSeparator
    }
    @IBAction func star5(_ sender: UIButton) {
        star1.tintColor = .yellow
        star2.tintColor = .yellow
        star3.tintColor = .yellow
        star4.tintColor = .yellow
        star5.tintColor = .yellow
    }
    
    
    @IBAction func star6(_ sender: UIButton) {
        star6.tintColor = .yellow
        star7.tintColor = .opaqueSeparator
        star8.tintColor = .opaqueSeparator
        star9.tintColor = .opaqueSeparator
        star10.tintColor = .opaqueSeparator
    }
    @IBAction func star7(_ sender: UIButton) {
        star6.tintColor = .yellow
        star7.tintColor = .yellow
        star8.tintColor = .opaqueSeparator
        star9.tintColor = .opaqueSeparator
        star10.tintColor = .opaqueSeparator
    }
    @IBAction func star8(_ sender: UIButton) {
        star6.tintColor = .yellow
        star7.tintColor = .yellow
        star8.tintColor = .yellow
        star9.tintColor = .opaqueSeparator
        star10.tintColor = .opaqueSeparator
    }
    @IBAction func star9(_ sender: UIButton) {
        star6.tintColor = .yellow
        star7.tintColor = .yellow
        star8.tintColor = .yellow
        star9.tintColor = .yellow
        star10.tintColor = .opaqueSeparator
    }
    @IBAction func star10(_ sender: UIButton) {
        star6.tintColor = .yellow
        star7.tintColor = .yellow
        star8.tintColor = .yellow
        star9.tintColor = .yellow
        star10.tintColor = .yellow
    }
    
    
}

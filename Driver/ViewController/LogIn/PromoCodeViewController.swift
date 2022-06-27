//
//  PromoCodeViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 28/11/1443 AH.
//

import UIKit

class PromoCodeViewController: UIViewController {

    @IBOutlet weak var Code: UILabel!
    @IBOutlet weak var copiedButton: UIButton!
    
    var newCode = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        copiedButton.layer.borderWidth = 1
        copiedButton.layer.cornerRadius = 10
        
        for _ in 0...9 {
            newCode += "\(Int.random(in: 0...9))"
        }
        Code.text = "DR-\(newCode)"
        
        UserDefaults.standard.setValue(newCode, forKey: "promoCode")

    }

    @IBAction func CopyCode(_ sender: UIButton) {
        
        copiedButton.layer.borderColor = .init(red: 204, green: 204, blue: 204, alpha: 100)
        copiedButton.backgroundColor = .lightGray
        copiedButton.tintColor = .gray
        copiedButton.setTitle("Copied", for: .normal)
        
    }
    
    @IBAction func Skip(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavID") as! MainViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
    }
    
}

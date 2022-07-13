//
//  ChangeViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 13/12/1443 AH.
//

import UIKit

class ChangeViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCard.layer.cornerRadius = 15
        self.hideKeyboardWhenTappedAround()

        guard let location = UserDefaults.standard.value(forKey: "location") as? String else {
            print("fffffffffffff")
             return
         }
        
        locationName.text = location
        name.text = "Aladil, Mecca"
        
    }
}

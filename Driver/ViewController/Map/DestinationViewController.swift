//
//  DestinationViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class DestinationViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        viewCard.layer.cornerRadius = 15
        
        guard let location = UserDefaults.standard.value(forKey: "location") as? String else {
            print("fffffffffffff")
             return
         }
        
        locationName.text = location
        name.text = "Aladil, Mecca"
        
    }

}

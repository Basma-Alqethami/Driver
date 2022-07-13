//
//  AfterCancelTripViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class AfterCancelTripViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        viewCard.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func moveback(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)

    }
    
}

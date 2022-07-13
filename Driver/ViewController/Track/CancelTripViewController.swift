//
//  CancelTripViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class CancelTripViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCard.layer.cornerRadius = 15
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func MoveBack(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}

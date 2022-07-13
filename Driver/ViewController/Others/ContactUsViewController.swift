//
//  ContactUsViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 11/12/1443 AH.
//

import UIKit
import UserNotifications

class ContactUsViewController: UIViewController  , UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//
//  ResetPasswordViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 27/11/1443 AH.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var NewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCard.layer.borderWidth = 1
        viewCard.layer.cornerRadius = 30
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func send(_ sender: UIButton) {
        
        guard let NewPassword = NewPassword.text, let confirmPassword = confirmPassword.text, !NewPassword.isEmpty, !confirmPassword.isEmpty else {
            alertUserError(msg: "Please fill in all fields")
            return
        }
        
        guard NewPassword.count >= 6 else {
            alertUserError(msg: "The password must be 6 digits or more")
            return
        }
        
        guard NewPassword == confirmPassword else {
            alertUserError(msg: "The password does not match")
            return
        }
        
        guard let PhoneNumber = UserDefaults.standard.value(forKey: "phone") as? String else {
            print("fffffffffffff")
             return
         }
                
        DatabaseManger.shared.ubdatePassword(with: PhoneNumber, password: NewPassword)
        
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        
    }
    
    func alertUserError(msg: String){
        let alert = UIAlertController(title: nil, message: msg , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

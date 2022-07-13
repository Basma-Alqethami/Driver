//
//  SignUpViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 27/11/1443 AH.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Number: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    @IBOutlet weak var PromoCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.borderWidth = 1
        cardView.layer.cornerRadius = 30
        self.hideKeyboardWhenTappedAround()

    }

    @IBAction func SignUp(_ sender: UIButton) {
        
        guard let name = Name.text, let Number = Number.text, let Password = Password.text, let ConfirmPassword = ConfirmPassword.text, !name.isEmpty, !Number.isEmpty, !Password.isEmpty, !ConfirmPassword.isEmpty else {
            alertUserError(msg: "Please fill in all fields")
            return
        }
        
        guard Number.count == 10 else {
            alertUserError(msg: "The mobile number must be 10 numbers")
            return
        }
        
        guard Password.count >= 6 else {
            alertUserError(msg: "The password must be 6 digits or more")
            return
        }
        
        guard Password == ConfirmPassword else {
            alertUserError(msg: "The password does not match")
            return
        }
        
        DatabaseManger.shared.userExists(with: Number, completion: { [weak self] exists in
            
            guard let strongSelf = self else {
                return
            }
            
            print(exists)
            guard !exists else {
                DispatchQueue.main.async {
                    strongSelf.alertUserError(msg: "Account already exists")
                }
                return
            }
            
            UserDefaults.standard.setValue(Number, forKey: "phone")
            UserDefaults.standard.setValue(name, forKey: "name")
            UserDefaults.standard.setValue(Password, forKey: "password")
            
            let User = User(Name: name,Phone: Number,Password: Password,PromoCode: " ")
            
            DatabaseManger.shared.insertUser(with: User , completion: { success in
                if success {
                    let vc = strongSelf.storyboard?.instantiateViewController(withIdentifier: "VerificationCode") as! ConfirmViewController
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .overCurrentContext
                    strongSelf.present(nav, animated: false)
                }
            })
        })
    }
    
    func alertUserError(msg: String){
        let alert = UIAlertController(title: nil, message: msg , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginView") as! LogInViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
    }
    
}

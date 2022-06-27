//
//  ViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 01/11/1443 AH.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var Number: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.borderWidth = 1
        cardView.layer.cornerRadius = 30
            

    }
    
    
    @IBAction func forgetPassword(_ sender: UIButton) {

    }
    
    @IBAction func LogIn(_ sender: UIButton) {
        
        guard let Number = Number.text, let Password = Password.text, !Number.isEmpty, !Password.isEmpty else {
            alertUserError(msg: "Please fill in all fields")
            return
        }
        
        guard Number.count == 10 else {
            alertUserError(msg: "The mobile number must be 10 numbers")
            return
        }
        
        guard Password.count >= 6 else {
            alertUserError(msg: "Password is less than 6 digits")
            return
        }
        
        DatabaseManger.shared.userExists(with: Number, completion: { [weak self] exists in
            
            guard let strongSelf = self else {
                return
            }
            
            print(exists)
            guard exists else {
                DispatchQueue.main.async {
                    strongSelf.alertUserError(msg: "Account not exists")
                }
                return
            }

            DatabaseManger.shared.getUserInfo(with: Number, completion: { result in
                switch result {
                    
                case .success(let data):
                    if (data.Password == Password) {
                        
                        UserDefaults.standard.setValue(data.Phone, forKey: "phone")
                        UserDefaults.standard.setValue(data.Name, forKey: "name")

                        let vc = strongSelf.storyboard?.instantiateViewController(withIdentifier: "VerificationCode") as! ConfirmViewController
                        let nav = UINavigationController(rootViewController: vc)
                        nav.modalPresentationStyle = .overCurrentContext
                        strongSelf.present(nav, animated: false)
                    }
                    else {
                        DispatchQueue.main.async {
                            strongSelf.alertUserError(msg: "The password is wrong")
                        }
                        return
                    }
                    
                case .failure(let error):
                    print("Failed to read data with error \(error)")
                }
            })
        })
        
    }
    
    func alertUserError(msg: String){
        let alert = UIAlertController(title: nil, message: msg , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signupView") as! SignUpViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
    }
    
}


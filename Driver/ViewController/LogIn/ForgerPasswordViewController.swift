//
//  ForgerPasswordViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 27/11/1443 AH.
//

import UIKit

class ForgerPasswordViewController: UIViewController {
    
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.borderWidth = 1
        cardView.layer.cornerRadius = 30
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func Send(_ sender: UIButton) {
        
        guard let PhoneNumber = PhoneNumber.text, !PhoneNumber.isEmpty else {
            alertUserError(msg: "Please enter your mobile number")
            return
        }
        
        guard PhoneNumber.count == 10 else {
            alertUserError(msg: "The mobile number must be 10 numbers")
            return
        }
        
        DatabaseManger.shared.userExists(with: PhoneNumber, completion: { [weak self] exists in
            
            guard let strongSelf = self else {
                return
            }
            
            print(exists)
            guard exists else {
                DispatchQueue.main.async {
                    strongSelf.alertUserError(msg: "This mobile number not exists")
                }
                return
            }

            DatabaseManger.shared.getUserInfo(with: PhoneNumber, completion: { result in
                switch result {
                    
                case .success(let data):
                    
                        UserDefaults.standard.setValue(data.Phone, forKey: "phone")
                        UserDefaults.standard.setValue(data.Name, forKey: "name")
                    
                        let vc = strongSelf.storyboard?.instantiateViewController(withIdentifier: "VerificationCo") as! ResetConfirmViewController
                        let nav = UINavigationController(rootViewController: vc)
                        nav.modalPresentationStyle = .overCurrentContext
                        strongSelf.present(nav, animated: false)
                
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
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  PaymentViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var discountView: UIStackView!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var promoCode: UITextField!
    @IBOutlet weak var applyCode: UIButton!
    
    
    @IBOutlet weak var applePay: UIButton!
    @IBOutlet weak var paypal: UIButton!
    @IBOutlet weak var card: UIButton!
    @IBOutlet weak var cash: UIButton!
    @IBOutlet weak var wallet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        discountView.isHidden = true
        applyCode.layer.cornerRadius = 10
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func apply(_ sender: UIButton) {
        guard let code = promoCode.text, !code.isEmpty else {return}
        discountView.isHidden = false
        totalPrice.text = "15"
        
        applyCode.setTitle("", for: .normal)
        applyCode.backgroundColor = .white
        applyCode.tintColor = .black
        applyCode.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        applyCode.contentMode = .scaleAspectFit
    }
    
    @IBAction func WalletAction(_ sender: UIButton) {
        
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        applePay.setImage(image1, for: .normal)
        paypal.setImage(image1, for: .normal)
        card.setImage(image1, for: .normal)
        cash.setImage(image1, for: .normal)
        wallet.setImage(image, for: .normal)
    }
    
    @IBAction func CashAction(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)
        
        applePay.setImage(image1, for: .normal)
        paypal.setImage(image1, for: .normal)
        card.setImage(image1, for: .normal)
        wallet.setImage(image1, for: .normal)
        cash.setImage(image, for: .normal)
        
    }
    @IBAction func CardAction(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)
        
        applePay.setImage(image1, for: .normal)
        paypal.setImage(image1, for: .normal)
        wallet.setImage(image1, for: .normal)
        cash.setImage(image1, for: .normal)
        card.setImage(image, for: .normal)
    }
    @IBAction func PayPalAction(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)
        
        applePay.setImage(image1, for: .normal)
        wallet.setImage(image1, for: .normal)
        card.setImage(image1, for: .normal)
        cash.setImage(image1, for: .normal)
        paypal.setImage(image, for: .normal)
    }
    @IBAction func AppleAction(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)
        
        wallet.setImage(image1, for: .normal)
        paypal.setImage(image1, for: .normal)
        card.setImage(image1, for: .normal)
        cash.setImage(image1, for: .normal)
        applePay.setImage(image, for: .normal)
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  MainViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 02/11/1443 AH.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {
    
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var mobileNum: UILabel!
    @IBOutlet weak var promoCode: UILabel!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        sideMenu.leftSide = true
                
        guard let name = UserDefaults.standard.value(forKey: "name") as? String else {
            print("fffffffffffff")
             return
         }
        
        guard let PhoneNumber = UserDefaults.standard.value(forKey: "phone") as? String else {
            print("fffffffffffff")
             return
         }
        
        guard let promo = UserDefaults.standard.value(forKey: "promoCode") as? String else {
            print("fffffffffffff")
             return
         }
        
        customerName.text = name
        mobileNum.text = PhoneNumber
        promoCode.text = "DR-\(promo)"
        
        datePicker.layer.borderColor = CGColor.init(red: 112, green: 112, blue: 112, alpha: 1)
        datePicker.layer.borderWidth = 6
        datePicker.layer.cornerRadius = 10
        self.datePicker.layer.borderColor   = CGColor.init(red: 112, green: 112, blue: 112, alpha: 1)
        self.datePicker.layer.borderWidth   = 1
        self.datePicker.layer.cornerRadius  = 10
        self.datePicker.layer.masksToBounds = true
    }
    
    @IBAction func Menu(_ sender: UIBarButtonItem) {

        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        present(sideMenu, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
        
    }
}

//
//  SideMenuViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 02/11/1443 AH.
//

import UIKit


//protocol SideMenuViewControllerDelegate {
//    func selectedCell(_ row: Int)
//}

class SideMenuViewController: UIViewController {

    @IBOutlet weak var customerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let name = UserDefaults.standard.value(forKey: "name") as? String else {
            print("fffffffffffff")
             return
         }
        
        customerName.text = name
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        
        UserDefaults.standard.setValue("", forKey: "name")
        UserDefaults.standard.setValue("", forKey: "phone")
        UserDefaults.standard.setValue("", forKey: "promoCode")

        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)

    }
    
}

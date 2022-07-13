//
//  WalletViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 11/12/1443 AH.
//

import UIKit
import SideMenu

class WalletViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBAction func Menu(_ sender: UIBarButtonItem) {
        
        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        present(sideMenu, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
        
    }

}

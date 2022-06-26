//
//  MainViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 02/11/1443 AH.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        sideMenu.leftSide = true
        
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

//
//  FavoritesTableViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 11/12/1443 AH.
//

import UIKit
import SideMenu


class FavoritesTableViewController: UITableViewController {
        

    let list = ["Movenpick Jeddah Al Nawras, Jeddah","Jeddah Waterfront, Jeddah","RedSea Mall, Jeddah","Thuluth cafe, Jeddah","Makkah Mall, Mecca","Masjid Al- Haram, Mecca","Makkah Towers, Mecca"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        sideMenu.leftSide = true
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell",for: indexPath) as! FavoriteCell
        
        cell.name.text = list[indexPath.row]
        return cell
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

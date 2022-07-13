//
//  NotificationsTableViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 11/12/1443 AH.
//

import UIKit
import SideMenu


class NotificationsTableViewController: UITableViewController {

    var msg = ["The driver is on the road to you", "The request has been sent successfully.", "The password has been changed successfully.", "The Information has been changed successfully."]
    
    var time = ["1 mins ago","7 mins ago","12 mins ago", "14 mins ago"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msg.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell",for: indexPath) as! NotificationCell
        
        cell.msg.text = msg[indexPath.row]
        cell.time.text = "\(time[indexPath.row]) "
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

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

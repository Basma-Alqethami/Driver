//
//  EditProfileViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 11/12/1443 AH.
//

import UIKit
import SideMenu
import UserNotifications

class EditProfileViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        guard let fullname = UserDefaults.standard.value(forKey: "name") as? String else {
            print("fffffffffffff")
             return
         }
        
        guard let PhoneNumber = UserDefaults.standard.value(forKey: "phone") as? String else {
            print("fffffffffffff")
             return
         }
        
        guard let passworddd = UserDefaults.standard.value(forKey: "password") as? String else {
            print("fffffffffffff")
             return
         }

        self.phone.text = PhoneNumber
        self.name.text = fullname
        self.password.text = passworddd
    }
    
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBAction func Menu(_ sender: UIBarButtonItem) {
        
        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        present(sideMenu, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func Update(_ sender: UIButton) {
        
        guard let name = name.text, let phone = phone.text,!phone.isEmpty, !name.isEmpty else {
            alertUserError(msg: "Please fill in all fields")
            return
        }
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.badge,.sound,.alert]) { granted, error in
            if error == nil {
                print("User permission is granted : \(granted)")
            }
        }
        //        Step-2 Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Successfully"
        content.body = "The Information has been changed successfully"
        
        
        //        Step-3 Create the notification trigger
        let date = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        
        
        //       Step-4 Create a request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        
        //      Step-5 Register with Notification Center
        center.add(request) { error in
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound,.alert])
    }
    
    func alertUserError(msg: String){
        let alert = UIAlertController(title: nil, message: msg , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

//
//  ChangePasswordViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 11/12/1443 AH.
//

import UIKit
import UserNotifications


class ChangePasswordViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var confirm: UITextField!
    @IBOutlet weak var New: UITextField!
    @IBOutlet weak var current: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func save(_ sender: UIButton) {
        guard let passworddd = UserDefaults.standard.value(forKey: "password") as? String else {
            print("fffffffffffff")
             return
         }
        
        guard let phone = UserDefaults.standard.value(forKey: "phone") as? String else {
            print("fffffffffffff")
             return
         }
        
        guard let confirm = confirm.text, let New = New.text, let current = current.text,!confirm.isEmpty, !New.isEmpty, !current.isEmpty else {
            alertUserError(msg: "Please fill in all fields")
            return
        }
        
        if (current == passworddd) {
            if (confirm == New){
                DatabaseManger.shared.ubdatePassword(with: phone, password: New)
                
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
                content.body = "The password has been changed successfully"
                
                
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
                self.dismiss(animated: true, completion: nil)
            }
            else {
                alertUserError(msg: "The new password does not match")
            }
        } else {
            alertUserError(msg: "The password is wrong")
        }
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .alert, .badge])
        
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func alertUserError(msg: String){
        let alert = UIAlertController(title: nil, message: msg , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

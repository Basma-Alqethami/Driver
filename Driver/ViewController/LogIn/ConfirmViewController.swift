//
//  confirmViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 27/11/1443 AH.
//

import UIKit
import UserNotifications
import Foundation

class ConfirmViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var mobileNum: UILabel!
    
    @IBOutlet weak var firstTF: UITextField!
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var thirdTF: UITextField!
    @IBOutlet weak var fourthTF: UITextField!
    @IBOutlet weak var time: UILabel!
    
    var totalTime = 60
    var timer: Timer!
    var firstNum = ""
    var secondNum = ""
    var thirdNum = ""
    var fourthNum = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileNum.text = (UserDefaults.standard.value(forKey: "phone") as! String)
        self.hideKeyboardWhenTappedAround()

        cardView.layer.borderWidth = 0.5
        firstTF.layer.borderWidth = 0.5
        secondTF.layer.borderWidth = 0.5
        thirdTF.layer.borderWidth = 0.5
        fourthTF.layer.borderWidth = 0.5
        
        cardView.layer.borderColor = .init(red: 245, green: 245, blue: 245, alpha: 100)
        firstTF.layer.borderColor = .init(red: 245, green: 245, blue: 245, alpha: 100)
        secondTF.layer.borderColor = .init(red: 245, green: 245, blue: 245, alpha: 100)
        thirdTF.layer.borderColor = .init(red: 245, green: 245, blue: 245, alpha: 100)
        fourthTF.layer.borderColor = .init(red: 245, green: 245, blue: 245, alpha: 100)
        
        cardView.layer.cornerRadius = 30
        firstTF.layer.cornerRadius = 28
        secondTF.layer.cornerRadius = 28
        thirdTF.layer.cornerRadius = 28
        fourthTF.layer.cornerRadius = 28
        
        startOtpTimer()
        
        firstNum = "\(Int.random(in: 0...9))"
        secondNum = "\(Int.random(in: 0...9))"
        thirdNum = "\(Int.random(in: 0...9))"
        fourthNum = "\(Int.random(in: 0...9))"
        
        let code = firstNum+secondNum+thirdNum+fourthNum
        notification(code: code)
        
    }
    
    func notification(code: String) {
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.badge,.sound,.alert]) { granted, error in
            if error == nil {
                print("User permission is granted : \(granted)")
            }
        }
        //        Step-2 Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Verification Code"
        content.body = "The Verification Code is: \(code)"
        
        
        //        Step-3 Create the notification trigger
        let date = Date().addingTimeInterval(5)
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
    
    // func for creat timer
    private func startOtpTimer() {
        self.totalTime = 60
        self.timer = Timer.scheduledTimer(timeInterval: 01.0,
                                          target: self,
                                          selector: #selector(updateTimer),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    // for update timer evry sec and print the time
    @objc func updateTimer() {
        self.time.text = self.timeFormatted(self.totalTime) // will show timer
        if totalTime != 0 {
            totalTime -= 1  // decrease counter timer
        } else {
            if let timer = self.timer {
                timer.invalidate() //  stop time after 1 min
                self.timer = nil
                resendButton.isEnabled = true
            }
        }
    }
    
    // for print the time like 00:00
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds) // format 00:00
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func verification(_ sender: UIButton) {
        guard let first = firstTF.text, let second = secondTF.text, let third = thirdTF.text, let fourth = fourthTF.text, !first.isEmpty, !second.isEmpty, !third.isEmpty, !fourth.isEmpty else {
            alertUserError(msg: "Please enter all code")
            return
        }
        
        if (first == firstNum && second == secondNum && third == thirdNum && fourth == fourthNum) {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PromoCodeView") as! PromoCodeViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
        }else {
            alertUserError(msg: "The code does not match")
        }
    }
    
    @IBAction func resend(_ sender: UIButton) {
        firstNum = "\(Int.random(in: 0...9))"
        secondNum = "\(Int.random(in: 0...9))"
        thirdNum = "\(Int.random(in: 0...9))"
        fourthNum = "\(Int.random(in: 0...9))"
        
        let code = firstNum+secondNum+thirdNum+fourthNum
        notification(code: code)
        startOtpTimer()
        resendButton.isEnabled = false

    }
    
    func alertUserError(msg: String){
        let alert = UIAlertController(title: nil, message: msg , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

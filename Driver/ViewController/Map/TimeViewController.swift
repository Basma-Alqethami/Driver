//
//  TimeViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 13/12/1443 AH.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var time: UIDatePicker!
    
    var selectedTime = ""
    var sagId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        viewCard.layer.cornerRadius = 15
        
    }

    @IBAction func GetTime(_ sender: UIDatePicker) {
        
        print("print \(sender.date)")

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let somedateString = dateFormatter.string(from: sender.date)
        selectedTime = somedateString
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let firstVC = segue.destination as? bookViewController else { return }
        firstVC.sagId = sagId
        firstVC.selectedTime = selectedTime
    }
    
}

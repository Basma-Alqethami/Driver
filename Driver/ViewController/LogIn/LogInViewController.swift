//
//  ViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 01/11/1443 AH.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.borderWidth = 1
        cardView.layer.cornerRadius = 30
//
//        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: LogInButton.frame.size.width, height: 3))
//        lineView.backgroundColor = UIColor.init(red: 204, green: 172, blue: 0, alpha: 1)
//        LogInButton.addSubview(lineView)
        
    }
}


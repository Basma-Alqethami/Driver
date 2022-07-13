//
//  ReportViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    
    @IBOutlet weak var cir1: UIButton!
    @IBOutlet weak var cir2: UIButton!
    @IBOutlet weak var cir3: UIButton!
    @IBOutlet weak var cir4: UIButton!
    @IBOutlet weak var cir5: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCard.layer.cornerRadius = 15
        self.hideKeyboardWhenTappedAround()

    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func send(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func circ1(_ sender: UIButton) {
        
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        cir1.setImage(image, for: .normal)
        cir2.setImage(image1, for: .normal)
        cir3.setImage(image1, for: .normal)
        cir4.setImage(image1, for: .normal)
        cir5.setImage(image1, for: .normal)
        
    }
    @IBAction func circ2(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        cir1.setImage(image1, for: .normal)
        cir2.setImage(image, for: .normal)
        cir3.setImage(image1, for: .normal)
        cir4.setImage(image1, for: .normal)
        cir5.setImage(image1, for: .normal)
    }
    @IBAction func circ3(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        cir1.setImage(image1, for: .normal)
        cir2.setImage(image1, for: .normal)
        cir3.setImage(image, for: .normal)
        cir4.setImage(image1, for: .normal)
        cir5.setImage(image1, for: .normal)
    }
    @IBAction func circ4(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        cir1.setImage(image1, for: .normal)
        cir2.setImage(image1, for: .normal)
        cir3.setImage(image1, for: .normal)
        cir4.setImage(image, for: .normal)
        cir5.setImage(image1, for: .normal)
    }
    @IBAction func circ5(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .medium)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        cir1.setImage(image1, for: .normal)
        cir2.setImage(image1, for: .normal)
        cir3.setImage(image1, for: .normal)
        cir4.setImage(image1, for: .normal)
        cir5.setImage(image, for: .normal)
    }

}

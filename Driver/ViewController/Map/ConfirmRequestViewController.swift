//
//  ConfirmRequestViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 12/12/1443 AH.
//

import UIKit

class ConfirmRequestViewController: UIViewController {
    
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var couName: UILabel!
    
    @IBOutlet weak var eeonomy: UIButton!
    @IBOutlet weak var vip: UIButton!
    
    var eeonomySelected = false
    var vipSelected = false
    
    @IBOutlet weak var minPriceView: UIStackView!
    @IBOutlet weak var maxPriceView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        minPriceView.isHidden = true
        maxPriceView.isHidden = true
        
        viewCard.layer.cornerRadius = 15
        
        guard let location = UserDefaults.standard.value(forKey: "location") as? String else {
            print("fffffffffffff")
            return
        }
        
        locationName.text = location
        couName.text = "Aladil, Mecca"
    }
    
    @IBAction func EeonomyCar(_ sender: UIButton) {
        
        if (vipSelected == true){
            vip.setBackgroundImage(UIImage(named: "BTT"), for: .normal)
            vipSelected = false
            maxPriceView.isHidden = true
        }
        
        if (eeonomySelected == false){
            eeonomy.setBackgroundImage(UIImage(named: "BTFILL"), for: .normal)
            eeonomySelected = true
            minPriceView.isHidden = false
        }else{
            eeonomy.setBackgroundImage(UIImage(named: "BT"), for: .normal)
            eeonomySelected = false
            minPriceView.isHidden = true
        }
    }
    
    @IBAction func VIPCar(_ sender: UIButton) {
        if (eeonomySelected == true ){
            eeonomy.setBackgroundImage(UIImage(named: "BT"), for: .normal)
            eeonomySelected = false
            minPriceView.isHidden = true
        }
        if (vipSelected == false){
            vip.setBackgroundImage(UIImage(named: "BTTFILL"), for: .normal)
            vipSelected = true
            maxPriceView.isHidden = false
        }else{
            vip.setBackgroundImage(UIImage(named: "BTT"), for: .normal)
            vipSelected = false
            maxPriceView.isHidden = true
        }
    }
}

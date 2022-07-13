//
//  bookViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 13/12/1443 AH.
//

import UIKit

class bookViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    
    @IBOutlet weak var goScroll: UIScrollView!
    @IBOutlet weak var aroundScroll: UIScrollView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var economv: UIButton!
    @IBOutlet weak var vip: UIButton!
    var eeonomySelected = false
    var vipSelected = false
    
    var selectedTime: String?
    var sagId: String?
    

    @IBOutlet weak var roundTrip: UIButton!
    @IBOutlet weak var go: UIButton!
    
    @IBOutlet weak var time1: UIButton!
    @IBOutlet weak var time2: UIButton!
    @IBOutlet weak var time3: UIButton!
    @IBOutlet weak var time4: UIButton!
    @IBOutlet weak var time5: UIButton!
    @IBOutlet weak var time6: UIButton!
    @IBOutlet weak var time7: UIButton!
    
    @IBOutlet weak var time11: UIButton!
    @IBOutlet weak var time22: UIButton!
    @IBOutlet weak var time33: UIButton!
    @IBOutlet weak var time44: UIButton!
    @IBOutlet weak var time55: UIButton!
    @IBOutlet weak var time66: UIButton!
    @IBOutlet weak var time77: UIButton!
    
    @IBOutlet weak var time111: UIButton!
    @IBOutlet weak var time222: UIButton!
    @IBOutlet weak var time333: UIButton!
    @IBOutlet weak var time444: UIButton!
    @IBOutlet weak var time555: UIButton!
    @IBOutlet weak var time666: UIButton!
    @IBOutlet weak var time777: UIButton!

    
    @IBOutlet weak var sun: UIButton!
    @IBOutlet weak var mun: UIButton!
    @IBOutlet weak var tue: UIButton!
    @IBOutlet weak var wed: UIButton!
    @IBOutlet weak var thu: UIButton!
    @IBOutlet weak var fri: UIButton!
    @IBOutlet weak var sat: UIButton!
    
    @IBOutlet weak var sun1: UIButton!
    @IBOutlet weak var mun2: UIButton!
    @IBOutlet weak var tue3: UIButton!
    @IBOutlet weak var wed4: UIButton!
    @IBOutlet weak var thu5: UIButton!
    @IBOutlet weak var fri6: UIButton!
    @IBOutlet weak var sat7: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        viewCard.layer.cornerRadius = 15
        goScroll.isHidden = true
        aroundScroll.isHidden = true
        
        guard let location = UserDefaults.standard.value(forKey: "location") as? String else {
            print("fffffffffffff")
             return
         }
        
        locationName.text = location
        name.text = "Aladil, Mecca"
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//
//    guard let selectedT = selectedTime else { return }
//    guard let id = sagId else { return }
//
//    }
    
    @IBAction func performUnwindSegueOperation(_ sender: UIStoryboardSegue) {
        
        if sagId == "1" {
            time1.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time1.setTitle(selectedTime, for: .normal)
            time1.setTitleColor(.white, for: .normal)
            
        } else if sagId == "2" {
            time2.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time2.setTitle(selectedTime, for: .normal)
            time2.setTitleColor(.white, for: .normal)
            
        } else if sagId == "3" {
            time3.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time3.setTitle(selectedTime, for: .normal)
            time3.setTitleColor(.white, for: .normal)
            
        } else if sagId == "4" {
            time4.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time4.setTitle(selectedTime, for: .normal)
            time4.setTitleColor(.white, for: .normal)
            
        } else if sagId == "5" {
            time5.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time5.setTitle(selectedTime, for: .normal)
            time5.setTitleColor(.white, for: .normal)
            
        } else if sagId == "6" {
            time6.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time6.setTitle(selectedTime, for: .normal)
            time6.setTitleColor(.white, for: .normal)
            
        } else if sagId == "7" {
            time7.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time7.setTitle(selectedTime, for: .normal)
            time7.setTitleColor(.white, for: .normal)
            
        } else if sagId == "8" {
            time11.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time11.setTitle(selectedTime, for: .normal)
            time11.setTitleColor(.white, for: .normal)
            
        } else if sagId == "9" {
            time22.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time22.setTitle(selectedTime, for: .normal)
            time22.setTitleColor(.white, for: .normal)
            
        } else if sagId == "10" {
            time33.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time33.setTitle(selectedTime, for: .normal)
            time33.setTitleColor(.white, for: .normal)
            
        } else if sagId == "11" {
            time44.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time44.setTitle(selectedTime, for: .normal)
            time44.setTitleColor(.white, for: .normal)
            
        } else if sagId == "12" {
            time55.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time55.setTitle(selectedTime, for: .normal)
            time55.setTitleColor(.white, for: .normal)
            
        } else if sagId == "13" {
            time66.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time66.setTitle(selectedTime, for: .normal)
            time66.setTitleColor(.white, for: .normal)
            
        } else if sagId == "14" {
            time77.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time77.setTitle(selectedTime, for: .normal)
            time77.setTitleColor(.white, for: .normal)
            
        } else if sagId == "15" {
            time111.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time111.setTitle(selectedTime, for: .normal)
            time111.setTitleColor(.white, for: .normal)
            
        } else if sagId == "16" {
            time222.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time222.setTitle(selectedTime, for: .normal)
            time222.setTitleColor(.white, for: .normal)
            
        } else if sagId == "17" {
            time333.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time333.setTitle(selectedTime, for: .normal)
            time333.setTitleColor(.white, for: .normal)
            
        } else if sagId == "18" {
            time444.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time444.setTitle(selectedTime, for: .normal)
            time444.setTitleColor(.white, for: .normal)
            
        } else if sagId == "19" {
            time555.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time555.setTitle(selectedTime, for: .normal)
            time555.setTitleColor(.white, for: .normal)
            
        } else if sagId == "20" {
            time666.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time666.setTitle(selectedTime, for: .normal)
            time666.setTitleColor(.white, for: .normal)
            
        } else if sagId == "21" {
            time777.setBackgroundImage(UIImage(named: "selectedTime"), for: .normal)
            time777.setTitle(selectedTime, for: .normal)
            time777.setTitleColor(.white, for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "1" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!

        } else if segue.identifier == "2" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "3" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "4" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "5" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "6" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "7" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "8" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "9" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "10" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "11" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "12" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "13" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "14" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "15" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "16" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "17" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "18" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "19" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        } else if segue.identifier == "20" {
            guard let firstVC = segue.destination as? TimeViewController else { return }
            firstVC.sagId = segue.identifier!
        }
        else if segue.identifier == "21" {
           guard let firstVC = segue.destination as? TimeViewController else { return }
           firstVC.sagId = segue.identifier!
       }
    }
    
    @IBAction func Economv(_ sender: UIButton) {
        
        if (vipSelected == true){
            vip.setBackgroundImage(UIImage(named: "BTT"), for: .normal)
            vipSelected = false
        }
        if (eeonomySelected == false){
            economv.setBackgroundImage(UIImage(named: "BTFILL"), for: .normal)
            eeonomySelected = true
        }else{
            economv.setBackgroundImage(UIImage(named: "BT"), for: .normal)
            eeonomySelected = false
        }
    }
    @IBAction func VIP(_ sender: UIButton) {

        if (eeonomySelected == true ){
            economv.setBackgroundImage(UIImage(named: "BT"), for: .normal)
            eeonomySelected = false
        }
        if (vipSelected == false){
            vip.setBackgroundImage(UIImage(named: "BTTFILL"), for: .normal)
            vipSelected = true
        }else{
            vip.setBackgroundImage(UIImage(named: "BTT"), for: .normal)
            vipSelected = false
        }
    }
    
    @IBAction func Go(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .small)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        go.setImage(image, for: .normal)
        roundTrip.setImage(image1, for: .normal)
        
        goScroll.isHidden = false
        aroundScroll.isHidden = true
    }
    @IBAction func Round(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(scale: .small)
        let image1 = UIImage(systemName: "circle", withConfiguration: config)
        let image = UIImage(systemName: "circle.inset.filled", withConfiguration: config)

        go.setImage(image1, for: .normal)
        roundTrip.setImage(image, for: .normal)
        
        goScroll.isHidden = true
        aroundScroll.isHidden = false
    }
    
    @IBAction func Sun(_ sender: UIButton) {
        sun.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        mun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)
        
        sun.setTitleColor(.white, for: .normal)
        mun.setTitleColor(color, for: .normal)
        tue.setTitleColor(color, for: .normal)
        wed.setTitleColor(color, for: .normal)
        thu.setTitleColor(color, for: .normal)
        fri.setTitleColor(color, for: .normal)
        sat.setTitleColor(color, for: .normal)
    }
    @IBAction func Mon(_ sender: UIButton) {
        sun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        mun.setTitleColor(.white, for: .normal)
        tue.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        
        sun.setTitleColor(color, for: .normal)
        tue.setTitleColor(color, for: .normal)
        wed.setTitleColor(color, for: .normal)
        thu.setTitleColor(color, for: .normal)
        fri.setTitleColor(color, for: .normal)
        sat.setTitleColor(color, for: .normal)
    }
    @IBAction func Tue(_ sender: UIButton) {
        sun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        tue.setTitleColor(.white, for: .normal)
        wed.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun.setTitleColor(color, for: .normal)
        mun.setTitleColor(color, for: .normal)
        wed.setTitleColor(color, for: .normal)
        thu.setTitleColor(color, for: .normal)
        fri.setTitleColor(color, for: .normal)
        sat.setTitleColor(color, for: .normal)
    }
    @IBAction func Wed(_ sender: UIButton) {
        sun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        wed.setTitleColor(.white, for: .normal)
        thu.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun.setTitleColor(color, for: .normal)
        mun.setTitleColor(color, for: .normal)
        tue.setTitleColor(color, for: .normal)
        thu.setTitleColor(color, for: .normal)
        fri.setTitleColor(color, for: .normal)
        sat.setTitleColor(color, for: .normal)
    }
    @IBAction func Thu(_ sender: UIButton) {
        sun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        thu.setTitleColor(.white, for: .normal)
        fri.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun.setTitleColor(color, for: .normal)
        mun.setTitleColor(color, for: .normal)
        tue.setTitleColor(color, for: .normal)
        wed.setTitleColor(color, for: .normal)
        fri.setTitleColor(color, for: .normal)
        sat.setTitleColor(color, for: .normal)
    }
    @IBAction func Fri(_ sender: UIButton) {
        sun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        fri.setTitleColor(.white, for: .normal)
        sat.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun.setTitleColor(color, for: .normal)
        mun.setTitleColor(color, for: .normal)
        tue.setTitleColor(color, for: .normal)
        wed.setTitleColor(color, for: .normal)
        thu.setTitleColor(color, for: .normal)
        sat.setTitleColor(color, for: .normal)
    }
    @IBAction func Sat(_ sender: UIButton) {
        sun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        sat.setTitleColor(.white, for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun.setTitleColor(color, for: .normal)
        mun.setTitleColor(color, for: .normal)
        tue.setTitleColor(color, for: .normal)
        wed.setTitleColor(color, for: .normal)
        thu.setTitleColor(color, for: .normal)
        fri.setTitleColor(color, for: .normal)
    }
    
    @IBAction func Sun1(_ sender: UIButton) {
        sun1.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        sun1.setTitleColor(.white, for: .normal)
        mun2.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue3.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed4.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu5.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri6.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat7.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        mun2.setTitleColor(color, for: .normal)
        tue3.setTitleColor(color, for: .normal)
        wed4.setTitleColor(color, for: .normal)
        thu5.setTitleColor(color, for: .normal)
        fri6.setTitleColor(color, for: .normal)
        sat7.setTitleColor(color, for: .normal)
    }
    @IBAction func Mon2(_ sender: UIButton) {
        sun1.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun2.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        mun2.setTitleColor(.white, for: .normal)
        tue3.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed4.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu5.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri6.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat7.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun1.setTitleColor(color, for: .normal)
        tue3.setTitleColor(color, for: .normal)
        wed4.setTitleColor(color, for: .normal)
        thu5.setTitleColor(color, for: .normal)
        fri6.setTitleColor(color, for: .normal)
        sat7.setTitleColor(color, for: .normal)
    }
    @IBAction func Tue3(_ sender: UIButton) {
        sun1.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun2.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue3.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        tue3.setTitleColor(.white, for: .normal)
        wed4.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu5.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri6.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat7.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun1.setTitleColor(color, for: .normal)
        mun2.setTitleColor(color, for: .normal)
        wed4.setTitleColor(color, for: .normal)
        thu5.setTitleColor(color, for: .normal)
        fri6.setTitleColor(color, for: .normal)
        sat7.setTitleColor(color, for: .normal)
    }
    @IBAction func Wed4(_ sender: UIButton) {
        sun1.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun2.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue3.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed4.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        wed4.setTitleColor(.white, for: .normal)
        thu5.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri6.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat7.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun1.setTitleColor(color, for: .normal)
        mun2.setTitleColor(color, for: .normal)
        tue3.setTitleColor(color, for: .normal)
        thu5.setTitleColor(color, for: .normal)
        fri6.setTitleColor(color, for: .normal)
        sat7.setTitleColor(color, for: .normal)
    }
    @IBAction func Thu5(_ sender: UIButton) {
        sun1.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun2.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue3.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed4.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu5.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        thu5.setTitleColor(.white, for: .normal)
        fri6.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat7.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun1.setTitleColor(color, for: .normal)
        mun2.setTitleColor(color, for: .normal)
        tue3.setTitleColor(color, for: .normal)
        wed4.setTitleColor(color, for: .normal)
        fri6.setTitleColor(color, for: .normal)
        sat7.setTitleColor(color, for: .normal)
    }
    @IBAction func Fri6(_ sender: UIButton) {
        sun1.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun2.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue3.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed4.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu5.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri6.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        fri6.setTitleColor(.white, for: .normal)
        sat7.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun1.setTitleColor(color, for: .normal)
        mun2.setTitleColor(color, for: .normal)
        tue3.setTitleColor(color, for: .normal)
        wed4.setTitleColor(color, for: .normal)
        thu5.setTitleColor(color, for: .normal)
        sat7.setTitleColor(color, for: .normal)
    }
    @IBAction func Sat7(_ sender: UIButton) {
        sun1.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        mun2.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        tue3.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        wed4.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        thu5.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        fri6.setBackgroundImage(UIImage(named: "Rectangle bt"), for: .normal)
        sat7.setBackgroundImage(UIImage(named: "selected"), for: .normal)
        sat7.setTitleColor(.white, for: .normal)
        let color = UIColor(red: 0.80, green: 0.67, blue: 0.00, alpha: 1.00)

        sun1.setTitleColor(color, for: .normal)
        mun2.setTitleColor(color, for: .normal)
        tue3.setTitleColor(color, for: .normal)
        wed4.setTitleColor(color, for: .normal)
        thu5.setTitleColor(color, for: .normal)
        fri6.setTitleColor(color, for: .normal)
    }
}

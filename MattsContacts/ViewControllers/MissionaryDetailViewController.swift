//
//  MissionaryDetailViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class MissionaryDetailViewController: UIViewController {
    
    var missionary: Missionary?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var parentsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var parentsEmailLabel: UILabel!
    @IBOutlet weak var missionLabel: UILabel!
    @IBOutlet weak var enterMtcDateLabel: UILabel!
    @IBOutlet weak var whichMtcLabel: UILabel!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var suitBrandLabel: UILabel!
    @IBOutlet weak var pantLabel: UILabel!
    @IBOutlet weak var pantWaistLabel: UILabel!
    @IBOutlet weak var pantLengthLabel: UILabel!
    @IBOutlet weak var pantBrandLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var shoesLabel: UILabel!
    @IBOutlet weak var shoeBrandLabel: UILabel!
    @IBOutlet weak var lsLabel: UILabel!
    @IBOutlet weak var lsBrand: UILabel!
    @IBOutlet weak var sleeveLabel: UILabel!
    @IBOutlet weak var ssLabel: UILabel!
    @IBOutlet weak var ssBrand: UILabel!
    @IBOutlet weak var coatLabel: UILabel!
    @IBOutlet weak var coatBrandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViews()
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        print("I need to finish this!!!")
    }
    
    func setUpViews() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "mm/dd/yy"
        
        guard let missionary = missionary else { return }

//        if missionary.parents == "" { parentsLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.address == "" { addressLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.city == "" { cityLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.state == "" { stateLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.zip == "" { zipLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.phone == "" { phoneLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.parentsEmail == "" { parentsEmailLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.mission == "" { missionLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.mtc == "" { whichMtcLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.suit == "" { suitLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.suitBrand == "" { suitBrandLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.pant == "" { pantLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.pantWaist == "" { pantWaistLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.pantLength == "" { pantLengthLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.pantBrand == "" { pantBrandLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.bottom == "" { bottomLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.front == "" { frontLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.shoes == "" { shoesLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.shoeBrand == "" { shoeBrandLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.lsShirtsNeck == "" { lsLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.lsBrand == "" { lsBrand.backgroundColor = UIColor.gray.withAlphaComponent(0.5)  }
//        if missionary.sleeve == "" { sleeveLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }
//        if missionary.ssShirtsNeck == "" { ssLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5)  }
//        if missionary.ssBrand == "" { ssBrand.backgroundColor = UIColor.gray.withAlphaComponent(0.5)  }
//        if missionary.coat == "" { coatLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5)  }
//        if missionary.coatBrand == "" { coatBrandLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5) }

        nameLabel.text = missionary.name
        birthdayLabel.text = dateFormatter.string(from: missionary.birthday ?? Date())
        parentsLabel.text = missionary.parents
        addressLabel.text = missionary.address
        cityLabel.text = missionary.city
        stateLabel.text = missionary.state
        zipLabel.text = missionary.zip
        phoneLabel.text = missionary.phone
        parentsEmailLabel.text = missionary.parentsEmail
        missionLabel.text = missionary.mission
        enterMtcDateLabel.text = dateFormatter.string(from: missionary.mtcDate ?? Date())
        whichMtcLabel.text = missionary.mtc
        suitLabel.text = missionary.suit
        suitBrandLabel.text = missionary.suitBrand
        pantLabel.text = missionary.pant
        pantWaistLabel.text = missionary.pantWaist
        pantLengthLabel.text = missionary.pantLength
        pantBrandLabel.text = missionary.pantBrand
        bottomLabel.text = missionary.bottom
        frontLabel.text = missionary.front
        shoesLabel.text = missionary.shoes
        shoeBrandLabel.text = missionary.shoeBrand
        lsLabel.text = missionary.lsShirtsNeck
        lsBrand.text = missionary.lsBrand
        sleeveLabel.text = missionary.sleeve
        ssLabel.text = missionary.ssShirtsNeck
        ssBrand.text = missionary.ssBrand
        coatLabel.text = missionary.coat
        coatBrandLabel.text = missionary.coatBrand
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewEditMissionary" {
            guard let detailVC = segue.destination as? AddEditMissionaryViewController,
                let missionary = missionary else { return }
            detailVC.missionary = missionary
        }
    }
}

//
//  AddEditMissionaryViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class AddEditMissionaryViewController: ShiftableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var parentsTextField: UITextField!
    @IBOutlet weak var addreddTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var parentsEmailTextField: UITextField!
    @IBOutlet weak var missionTextField: UITextField!
    @IBOutlet weak var enterMTCDateTextField: UITextField!
    @IBOutlet weak var whichMTCTextField: UITextField!
    @IBOutlet weak var suitTextField: UITextField!
    @IBOutlet weak var suitBrandTextField: UITextField!
    @IBOutlet weak var pantTextField: UITextField!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var frontTextField: UITextField!
    @IBOutlet weak var shoesTextField: UITextField!
    @IBOutlet weak var shoeBrandTextField: UITextField!
    @IBOutlet weak var lsTextField: UITextField!
    @IBOutlet weak var sleeveTextField: UITextField!
    @IBOutlet weak var lsBrandTextField: UITextField!
    @IBOutlet weak var ssTextField: UITextField!
    @IBOutlet weak var ssBrandTextField: UITextField!
    @IBOutlet weak var coatTextField: UITextField!
    @IBOutlet weak var coatBrandTextField: UITextField!
    
    var missionary: Missionary?
    var alreadyExists: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        birthdayTextField.delegate = self
        parentsTextField.delegate = self
        addreddTextField.delegate = self
        cityTextField.delegate = self
        stateTextField.delegate = self
        zipTextField.delegate = self
        phoneNumberTextField.delegate = self
        parentsEmailTextField.delegate = self
        missionTextField.delegate = self
        enterMTCDateTextField.delegate = self
        whichMTCTextField.delegate = self
        suitTextField.delegate = self
        suitBrandTextField.delegate = self
        pantTextField.delegate = self
        waistTextField.delegate = self
        lengthTextField.delegate = self
        brandTextField.delegate = self
        bottomTextField.delegate = self
        frontTextField.delegate = self
        shoesTextField.delegate = self
        shoeBrandTextField.delegate = self
        lsTextField.delegate = self
        sleeveTextField.delegate = self
        lsBrandTextField.delegate = self
        ssTextField.delegate = self
        ssBrandTextField.delegate = self
        coatTextField.delegate = self
        coatBrandTextField.delegate = self
        
        birthdayTextField.placeholder = "mm/dd/yyyy"
        enterMTCDateTextField.placeholder = "mm/dd/yyyy"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "mm/dd/yyyy"
        guard let missionary = missionary else { return }
        alreadyExists = true
        nameTextField.text = missionary.name
        birthdayTextField.text = dateFormatter.string(from: missionary.birthday ?? Date())
        parentsTextField.text = missionary.parents
        addreddTextField.text = missionary.address
        cityTextField.text = missionary.city
        stateTextField.text = missionary.state
        zipTextField.text = missionary.zip
        phoneNumberTextField.text = missionary.phone
        parentsEmailTextField.text = missionary.parentsEmail
        missionTextField.text = missionary.mission
        enterMTCDateTextField.text = dateFormatter.string(from: missionary.mtcDate ?? Date())
        whichMTCTextField.text = missionary.mtc
        suitTextField.text = missionary.suit
        suitBrandTextField.text = missionary.suitBrand
        pantTextField.text = missionary.pant
        waistTextField.text = missionary.pantWaist
        lengthTextField.text = missionary.pantLength
        bottomTextField.text = missionary.bottom
        frontTextField.text = missionary.front
        shoesTextField.text = missionary.shoes
        shoeBrandTextField.text = missionary.shoeBrand
        lsTextField.text = missionary.lsShirtsNeck
        lsBrandTextField.text = missionary.lsBrand
        sleeveTextField.text = missionary.sleeve
        ssTextField.text = missionary.ssShirtsNeck
        ssBrandTextField.text = missionary.ssBrand
        coatTextField.text = missionary.coat
        coatBrandTextField.text = missionary.coatBrand
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
       guard let name = nameTextField.text, name != "",
        let birthdayString = birthdayTextField.text, birthdayString != "",
        let birthday = dateFormatter.date(from: birthdayString) else { return }
        let parents = parentsTextField.text
        let address = addreddTextField.text
        let city = cityTextField.text
        let state = stateTextField.text
        let zip = zipTextField.text
        let phone = phoneNumberTextField.text
        let parentsEmail = parentsEmailTextField.text
        let mission = missionTextField.text
        let mtcDateString = enterMTCDateTextField.text
        let mtcDate = dateFormatter.date(from: mtcDateString ?? "")
        let mtc = whichMTCTextField.text
        let suit = suitTextField.text
        let suitBrand = suitBrandTextField.text
        let pant = pantTextField.text
        let pantWaist = waistTextField.text
        let pantLength = lengthTextField.text
        let bottom = bottomTextField.text
        let front = frontTextField.text
        let shoes = shoesTextField.text
        let shoeBrand = shoeBrandTextField.text
        let lsShirtsNeck = lsTextField.text
        let lsBrand = lsBrandTextField.text
        let sleeve = sleeveTextField.text
        let ssShirtsNeck = ssTextField.text
        let ssBrand = ssBrandTextField.text
        let coat = coatTextField.text
        let coatBrand = coatBrandTextField.text
        
        if let missionary = missionary {
            MissionaryController.shared.update(missionary: missionary, name: name, parents: parents ?? "", address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", parentsEmail: parentsEmail ?? "", mission: mission ?? "", mtcDate: mtcDate ?? Date(), mtc: mtc ?? "", suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday, pant: pant ?? "", sleeve: sleeve ?? "")
        } else {
            MissionaryController.shared.createMissioanry(name: name, parents: parents ?? "", address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", parentsEmail: parentsEmail ?? "", mission: mission ?? "", mtcDate: mtcDate ?? Date(), mtc: mtc ?? "", suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday, pant: pant ?? "", sleeve: sleeve ?? "")
        }
            navigationController?.popViewController(animated: true)
    }

}

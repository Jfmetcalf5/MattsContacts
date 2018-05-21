//
//  AddEditMissionaryViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class AddEditMissionaryViewController: ShiftableViewController, UIPickerViewDelegate {
    
    @IBOutlet var pickerView: UIDatePicker!
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
    @IBOutlet weak var note1TextField: UITextField!
    @IBOutlet weak var note2TextField: UITextField!
    @IBOutlet weak var note3TextField: UITextField!
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
    @IBOutlet weak var shoes2TextField: UITextField!
    @IBOutlet weak var shoes2BrandTextField: UITextField!
    @IBOutlet weak var lsTextField: UITextField!
    @IBOutlet weak var sleeveTextField: UITextField!
    @IBOutlet weak var lsBrandTextField: UITextField!
    @IBOutlet weak var ssTextField: UITextField!
    @IBOutlet weak var ssBrandTextField: UITextField!
    @IBOutlet weak var coatTextField: UITextField!
    @IBOutlet weak var coatBrandTextField: UITextField!
    
    var missionary: Missionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createToolBar()
//
        pickerView.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        nameTextField.delegate = self
        birthdayTextField.delegate = self
        birthdayTextField.inputView = pickerView
        parentsTextField.delegate = self
        addreddTextField.delegate = self
        cityTextField.delegate = self
        stateTextField.delegate = self
        zipTextField.delegate = self
        phoneNumberTextField.delegate = self
        parentsEmailTextField.delegate = self
        missionTextField.delegate = self
        enterMTCDateTextField.delegate = self
        enterMTCDateTextField.inputView = pickerView
        whichMTCTextField.delegate = self
        note1TextField.delegate = self
        note2TextField.delegate = self
        note3TextField.delegate = self
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
        shoes2TextField.delegate = self
        shoes2BrandTextField.delegate = self
        lsTextField.delegate = self
        sleeveTextField.delegate = self
        lsBrandTextField.delegate = self
        ssTextField.delegate = self
        ssBrandTextField.delegate = self
        coatTextField.delegate = self
        coatBrandTextField.delegate = self
        
        birthdayTextField.placeholder = "mm/dd/yy"
        enterMTCDateTextField.placeholder = "mm/dd/yy"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "mm/dd/yy"
        guard let missionary = missionary else { return }
        let notes = missionary.notes?.components(separatedBy: "\n")
        let note1 = notes?.first
        let note3 = notes?.last
        let note2 = notes?[1]
        if let name = missionary.name, let lastName = missionary.lastName {
            if name == lastName {
                nameTextField.text = name
            } else {
                nameTextField.text = "\(name) \(lastName)"
            }
        }
        if let birthday = missionary.birthday {
            birthdayTextField.text = dateFormatter.string(from: birthday)
            pickerView.setDate(birthday, animated: true)
        } else {
            birthdayTextField.text = ""
        }
        parentsTextField.text = missionary.parents
        addreddTextField.text = missionary.address
        cityTextField.text = missionary.city
        stateTextField.text = missionary.state
        zipTextField.text = missionary.zip
        phoneNumberTextField.text = missionary.phone
        parentsEmailTextField.text = missionary.parentsEmail
        missionTextField.text = missionary.mission
        if let mtcDate = missionary.mtcDate {
            enterMTCDateTextField.text = dateFormatter.string(from: mtcDate)
        } else {
            enterMTCDateTextField.text = ""
        }
        whichMTCTextField.text = missionary.mtc
        note1TextField.text = note1
        note2TextField.text = note2
        note3TextField.text = note3
        suitTextField.text = missionary.suit
        suitBrandTextField.text = missionary.suitBrand
        pantTextField.text = missionary.pant
        waistTextField.text = missionary.pantWaist
        lengthTextField.text = missionary.pantLength
        bottomTextField.text = missionary.bottom
        frontTextField.text = missionary.front
        shoesTextField.text = missionary.shoes
        shoeBrandTextField.text = missionary.shoeBrand
        shoes2BrandTextField.text = missionary.shoes2
        shoes2BrandTextField.text = missionary.shoes2Brand
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
        dateFormatter.dateFormat = "mm/dd/yy"
        guard let wholeName = nameTextField.text, wholeName != "" else { return }
        let firstAndLast = wholeName.components(separatedBy: " ")
        let name = firstAndLast.first ?? ""
        let lastName = firstAndLast.last ?? ""
        let note1 = note1TextField.text ?? ""
        let note2 = note2TextField.text ?? ""
        let note3 = note3TextField.text ?? ""
        let birthdayString = birthdayTextField.text
        let birthday = dateFormatter.date(from: birthdayString ?? "")
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
        let notes = "\(note1)\n\(note2)\n\(note3)"
        let suit = suitTextField.text
        let suitBrand = suitBrandTextField.text
        let pant = pantTextField.text
        let pantWaist = waistTextField.text
        let pantLength = lengthTextField.text
        let bottom = bottomTextField.text
        let front = frontTextField.text
        let shoes = shoesTextField.text
        let shoeBrand = shoeBrandTextField.text
        let shoes2 = shoes2TextField.text
        let shoes2Brand = shoes2BrandTextField.text
        let lsShirtsNeck = lsTextField.text
        let lsBrand = lsBrandTextField.text
        let sleeve = sleeveTextField.text
        let ssShirtsNeck = ssTextField.text
        let ssBrand = ssBrandTextField.text
        let coat = coatTextField.text
        let coatBrand = coatBrandTextField.text
        
        if let missionary = missionary {
            MissionaryController.shared.update(missionary: missionary, name: name, lastName: lastName, parents: parents ?? "", address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", parentsEmail: parentsEmail ?? "", mission: mission ?? "", mtcDate: mtcDate ?? nil, mtc: mtc ?? "", notes: notes, suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", shoes2: shoes2 ?? "", shoes2Brand: shoes2Brand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday ?? nil, pant: pant ?? "", sleeve: sleeve ?? "")
        } else {
            MissionaryController.shared.createMissioanry(name: name, lastName: lastName, parents: parents ?? "", address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", parentsEmail: parentsEmail ?? "", mission: mission ?? "", mtcDate: mtcDate ?? nil, mtc: mtc ?? "", notes: notes, suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", shoes2: shoes2 ?? "", shoes2Brand: shoes2Brand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday ?? nil, pant: pant ?? "", sleeve: sleeve ?? "")
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Picker View Stuffs
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yy"
        dateFormatter.dateStyle = .short
        if birthdayTextField.isEditing {
            birthdayTextField.text = dateFormatter.string(from: pickerView.date)
        }
        if enterMTCDateTextField.isEditing {
            enterMTCDateTextField.text = dateFormatter.string(from: pickerView.date)
        }
    }
}

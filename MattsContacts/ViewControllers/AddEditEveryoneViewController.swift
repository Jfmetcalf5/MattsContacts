//
//  AddEditEveryoneViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class AddEditEveryoneViewController: ShiftableViewController {
    
    var person: Person?
    
    @IBOutlet var pickerView: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var lastVisitTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var note1TextField: UITextField!
    @IBOutlet weak var note2TextField: UITextField!
    @IBOutlet weak var note3TextField: UITextField!
    @IBOutlet weak var suitTextField: UITextField!
    @IBOutlet weak var suitBrandTextField: UITextField!
    @IBOutlet weak var pantWaistTextField: UITextField!
    @IBOutlet weak var pantLengthTextField: UITextField!
    @IBOutlet weak var pantBrandTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var frontTextField: UITextField!
    @IBOutlet weak var shoesTextField: UITextField!
    @IBOutlet weak var shoeBrandTextField: UITextField!
    @IBOutlet weak var shoes2TextField: UITextField!
    @IBOutlet weak var shoes2BrandTextField: UITextField!
    @IBOutlet weak var lsShirtsNeckTextField: UITextField!
    @IBOutlet weak var sleeveTextField: UITextField!
    @IBOutlet weak var shirtBrandTextField: UITextField!
    @IBOutlet weak var ssShirtsNeckTextField: UITextField!
    @IBOutlet weak var ssBrandTextField: UITextField!
    @IBOutlet weak var coatTextField: UITextField!
    @IBOutlet weak var coatBrandTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        nameTextField.delegate = self
        birthdayTextField.delegate = self
        birthdayTextField.inputView = pickerView
        lastVisitTextField.delegate = self
        lastVisitTextField.inputView = pickerView
        addressTextField.delegate = self
        cityTextField.delegate = self
        stateTextField.delegate = self
        zipTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        note1TextField.delegate = self
        note2TextField.delegate = self
        note1TextField.delegate = self
        suitTextField.delegate = self
        suitBrandTextField.delegate = self
        pantWaistTextField.delegate = self
        pantLengthTextField.delegate = self
        pantBrandTextField.delegate = self
        bottomTextField.delegate = self
        frontTextField.delegate = self
        shoesTextField.delegate = self
        shoeBrandTextField.delegate = self
        shoes2TextField.delegate = self
        shoes2BrandTextField.delegate = self
        lsShirtsNeckTextField.delegate = self
        sleeveTextField.delegate = self
        shirtBrandTextField.delegate = self
        ssShirtsNeckTextField.delegate = self
        ssBrandTextField.delegate = self
        coatTextField.delegate = self
        coatBrandTextField.delegate = self
        
        birthdayTextField.placeholder = "mm/dd/yy"
        lastVisitTextField.placeholder = "mm/dd/yy"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yy"
        guard let person = person else { return }
        let notes = person.notes?.components(separatedBy: "\n")
        let note1 = notes?.first
        let note3 = notes?.last
        let note2 = notes?[1]
        if let name = person.name, let lastName = person.lastName {
            if name == lastName {
                nameTextField.text = name
            } else {
                nameTextField.text = "\(name) \(lastName)"
            }
        }
        if let birthday = person.birthday {
            birthdayTextField.text = dateFormatter.string(from: birthday)
            pickerView.setDate(birthday, animated: true)
        } else {
            birthdayTextField.text = ""
        }
        if let lastVisitDate = person.lastVisit {
            lastVisitTextField.text = dateFormatter.string(from: lastVisitDate)
            pickerView.setDate(lastVisitDate, animated: true)
        } else {
            lastVisitTextField.text = ""
        }
        addressTextField.text = person.address
        cityTextField.text = person.city
        stateTextField.text = person.state
        zipTextField.text = person.zip
        phoneTextField.text = person.phone
        emailTextField.text = person.email
        note1TextField.text = note1
        note2TextField.text = note2
        note3TextField.text = note3
        suitTextField.text = person.suit
        suitBrandTextField.text = person.suitBrand
        pantWaistTextField.text = person.pantWaist
        pantLengthTextField.text = person.pantLength
        bottomTextField.text = person.bottom
        frontTextField.text = person.front
        shoesTextField.text = person.shoes
        shoeBrandTextField.text = person.shoeBrand
        shoes2TextField.text = person.shoes2
        shoes2BrandTextField.text = person.shoes2Brand
        lsShirtsNeckTextField.text = person.lsShirtsNeck
        shirtBrandTextField.text = person.lsBrand
        sleeveTextField.text = person.sleeve
        ssShirtsNeckTextField.text = person.ssShirtsNeck
        ssBrandTextField.text = person.ssBrand
        coatTextField.text = person.coat
        coatBrandTextField.text = person.coatBrand
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
        let lastVisitString = lastVisitTextField.text
        let lastVisit = dateFormatter.date(from: lastVisitString ?? "")
        let address = addressTextField.text
        let city = cityTextField.text
        let state = stateTextField.text
        let zip = zipTextField.text
        let phone = phoneTextField.text
        let email = emailTextField.text
        let notes = "\(note1)\n\(note2)\n\(note3)"
        let suit = suitTextField.text
        let suitBrand = suitBrandTextField.text
        let pantWaist = pantWaistTextField.text
        let pantLength = pantLengthTextField.text
        let bottom = bottomTextField.text
        let front = frontTextField.text
        let shoes = shoesTextField.text
        let shoeBrand = shoeBrandTextField.text
        let shoes2 = shoes2TextField.text
        let shoes2Brand = shoes2BrandTextField.text
        let lsShirtsNeck = lsShirtsNeckTextField.text
        let lsBrand = shirtBrandTextField.text
        let sleeve = sleeveTextField.text
        let ssShirtsNeck = ssShirtsNeckTextField.text
        let ssBrand = ssBrandTextField.text
        let coat = coatTextField.text
        let coatBrand = coatBrandTextField.text
        
        if let person = person {
            PersonController.shared.update(person: person, name: name, lastName: lastName, lastVisit: lastVisit ?? nil, address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", email: email ?? "", notes: notes, suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", shoes2: shoes2 ?? "", shoes2Brand: shoes2Brand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday ?? nil, sleeve: sleeve ?? "")
        } else {
            PersonController.shared.createPerson(name: name, lastName: lastName, lastVisit: lastVisit ?? nil, address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", email: email ?? "", notes: notes, suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", shoes2: shoes2 ?? "", shoes2Brand: shoes2Brand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday ?? nil, sleeve: sleeve ?? "")
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
        if lastVisitTextField.isEditing {
            lastVisitTextField.text = dateFormatter.string(from: pickerView.date)
        }
    }
}

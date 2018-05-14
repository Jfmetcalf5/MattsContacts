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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
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
        nameTextField.delegate = self
        birthdayTextField.delegate = self
        addressTextField.delegate = self
        cityTextField.delegate = self
        stateTextField.delegate = self
        zipTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
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
        
        birthdayTextField.placeholder = "mm/dd/yyyy"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        guard let person = person else { return }
        nameTextField.text = person.name
        birthdayTextField.text = dateFormatter.string(from: person.birthday ?? Date())
        addressTextField.text = person.address
        cityTextField.text = person.city
        stateTextField.text = person.state
        zipTextField.text = person.zip
        phoneTextField.text = person.phone
        emailTextField.text = person.email
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
        dateFormatter.dateFormat = "mm/dd/yyyy"
        guard let name = nameTextField.text, name != "" else { return }
        let birthdayString = birthdayTextField.text
        let birthday = dateFormatter.date(from: birthdayString ?? "")
        let address = addressTextField.text
        let city = cityTextField.text
        let state = stateTextField.text
        let zip = zipTextField.text
        let phone = phoneTextField.text
        let email = emailTextField.text
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
            PersonController.shared.update(person: person, name: name, address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", email: email ?? "", suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", shoes2: shoes2 ?? "", shoes2Brand: shoes2Brand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday ?? Date(), sleeve: sleeve ?? "")
        } else {
            PersonController.shared.createPerson(name: name, address: address ?? "", city: city ?? "", state: state ?? "", zip: zip ?? "", phone: phone ?? "", email: email ?? "", suit: suit ?? "", suitBrand: suitBrand ?? "", pantWaist: pantWaist ?? "", pantLength: pantLength ?? "", bottom: bottom ?? "", front: front ?? "", shoes: shoes ?? "", shoeBrand: shoeBrand ?? "", shoes2: shoes2 ?? "", shoes2Brand: shoes2Brand ?? "", lsShirtsNeck: lsShirtsNeck ?? "", lsBrand: lsBrand ?? "", ssShirtsNeck: ssShirtsNeck ?? "", ssBrand: ssBrand ?? "", coat: coat ?? "", coatBrand: coatBrand ?? "", birthday: birthday ?? Date(), sleeve: sleeve ?? "")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}

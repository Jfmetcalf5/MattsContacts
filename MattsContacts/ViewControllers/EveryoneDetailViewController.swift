//
//  EveryoneDetailViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit
import MessageUI

class EveryoneDetailViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    var person: Person?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var suitBrandLabel: UILabel!
    @IBOutlet weak var pantWaistLabel: UILabel!
    @IBOutlet weak var pantLengthLabel: UILabel!
    @IBOutlet weak var pantBrandLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var shoesLabel: UILabel!
    @IBOutlet weak var shoeBrandLabel: UILabel!
    @IBOutlet weak var shoes2Label: UILabel!
    @IBOutlet weak var shoes2BrandLabel: UILabel!
    @IBOutlet weak var lsLabel: UILabel!
    @IBOutlet weak var sleeveLabel: UILabel!
    @IBOutlet weak var lsBrandLabel: UILabel!
    @IBOutlet weak var ssLabel: UILabel!
    @IBOutlet weak var ssBrandLabel: UILabel!
    @IBOutlet weak var coatLabel: UILabel!
    @IBOutlet weak var coatBrandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViews()
    }
    
    @IBAction func phoneButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Text Message?", message: "", preferredStyle: .alert)
        let textAction = UIAlertAction(title: "Yes", style: .default) { (text) in
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController()
                controller.body = ""
                controller.recipients = [self.phoneLabel.text ?? ""]
                controller.messageComposeDelegate = self
                self.present(controller, animated: true, completion: nil)
            }
        }
        let callAction = UIAlertAction(title: "No", style: .default) { (call) in
            guard let url = URL(string: "tel://\(self.phoneLabel.text ?? "")") else {
                return }
            UIApplication.shared.open(url, options: [:]) { (called) in
                
            }
        }
        
        alert.addAction(textAction)
        alert.addAction(callAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Send an Email?", message: "", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (yes) in
            guard let url = URL(string: "mailto:\(self.emailLabel.text ?? "")") else {
                return }
            UIApplication.shared.open(url, options: [:]) { (called) in
                if called {
                    print("We somehow did it")
                }
            }
        }
        let noAction = UIAlertAction(title: "Nope", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func setUpViews() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "mm/dd/yy"
        
        guard let person = person else { return }
        nameLabel.text = person.name
        birthdayLabel.text = dateFormatter.string(from: person.birthday ?? Date())
        addressLabel.text = person.address
        cityLabel.text = person.city
        stateLabel.text = person.state
        zipLabel.text = person.zip
        phoneLabel.text = person.phone
        emailLabel.text = person.email
        notesTextView.text = person.notes
        suitLabel.text = person.suit
        suitBrandLabel.text = person.suitBrand
        pantWaistLabel.text = person.pantWaist
        pantLengthLabel.text = person.pantLength
        pantBrandLabel.text = person.pantBrand
        bottomLabel.text = person.bottom
        frontLabel.text = person.front
        shoesLabel.text = person.shoes
        shoeBrandLabel.text = person.shoeBrand
        shoes2Label.text = person.shoes2
        shoes2BrandLabel.text = person.shoes2Brand
        lsLabel.text = person.lsShirtsNeck
        lsBrandLabel.text = person.lsBrand
        sleeveLabel.text = person.sleeve
        ssLabel.text = person.ssShirtsNeck
        ssBrandLabel.text = person.ssBrand
        coatLabel.text = person.coat
        coatBrandLabel.text = person.coatBrand
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditPerson" {
            guard let detailVC = segue.destination as? AddEditEveryoneViewController,
                let person = person else { return }
            detailVC.person = person
        }
    }
}

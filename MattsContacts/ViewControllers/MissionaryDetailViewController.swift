//
//  MissionaryDetailViewController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit
import MessageUI

class MissionaryDetailViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
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
    @IBOutlet weak var notesTextView: UITextView!
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
    @IBOutlet weak var shoes2BrandLabel: UILabel!
    @IBOutlet weak var shoes2Label: UILabel!
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
            guard let url = URL(string: "mailto:\(self.parentsEmailLabel.text ?? "")") else {
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
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "dd/mm/yy"
        
        guard let missionary = missionary else { return }
        if let name = missionary.name, let lastName = missionary.lastName {
            if name == lastName {
                nameLabel.text = name
            } else {
                nameLabel.text = "\(name) \(lastName)"
            }
        }
        if let birthday = missionary.birthday {
        birthdayLabel.text = dateFormatter.string(from: birthday)
        } else {
            birthdayLabel.text = ""
        }
        parentsLabel.text = missionary.parents
        addressLabel.text = missionary.address
        cityLabel.text = missionary.city
        stateLabel.text = missionary.state
        zipLabel.text = missionary.zip
        phoneLabel.text = missionary.phone
        parentsEmailLabel.text = missionary.parentsEmail
        notesTextView.text = missionary.notes
        missionLabel.text = missionary.mission
        if let mtcDate = missionary.mtcDate {
        enterMtcDateLabel.text = dateFormatter.string(from: mtcDate)
        } else {
            enterMtcDateLabel.text = ""
        }
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
        shoes2Label.text = missionary.shoes2
        shoes2BrandLabel.text = missionary.shoes2Brand
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

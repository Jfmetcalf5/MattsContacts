//
//  MissionaryController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation
import CoreData

class MissionaryController {
    
    static let shared = MissionaryController()
    
    var missionaries: [Missionary] {
        let request: NSFetchRequest<Missionary> = Missionary.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    func createMissioanry(name: String, parents: String, address: String, city: String, state: String, zip: Int16, phone: String, parentsEmail: String, mission: String, mtcDate: String, mtc: String, suit: String, suitBrand: String, pantWaist: String, pantLength: String, bottom: String, shoes: String, shoeBrand: String,lsShirtsNeck: String, lsBrand: String, ssShirtsNeck: String, ssBrand: String, coat: String, coatBrand: String, birthday: Date) {
        
        let _ = Missionary(name: name, parents: parents, address: address, city: city, state: state, zip: zip, phone: phone, parentsEmail: parentsEmail, mission: mission, mtcDate: mtcDate, mtc: mtc, suit: suit, suitBrand: suitBrand, pantWaist: pantWaist, pantLength: pantLength, bottom: bottom, shoes: shoes, shoeBrand: shoeBrand, lsShirtsNeck: lsShirtsNeck, lsBrand: lsBrand, ssShirtsNeck: ssShirtsNeck, ssBrand: ssBrand, coat: coat, coatBrand: coatBrand, birthday: birthday)
        saveToPersistentStore()
    }
    
    func delete(missionary: Missionary) {
        if let moc = missionary.managedObjectContext {
            moc.delete(missionary)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

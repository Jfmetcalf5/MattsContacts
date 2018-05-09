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
    
    func createMissioanry(name: String, parents: String, address: String, city: String, state: String, zip: String, phone: String, parentsEmail: String, mission: String, mtcDate: Date, mtc: String, suit: String, suitBrand: String, pantWaist: String, pantLength: String, bottom: String, front: String, shoes: String, shoeBrand: String, shoes2: String, shoes2Brand: String, lsShirtsNeck: String, lsBrand: String, ssShirtsNeck: String, ssBrand: String, coat: String, coatBrand: String, birthday: Date, pant: String, sleeve: String) {
        
        let _ = Missionary(name: name, parents: parents, address: address, city: city, state: state, zip: zip, phone: phone, parentsEmail: parentsEmail, mission: mission, mtcDate: mtcDate, mtc: mtc, suit: suit, suitBrand: suitBrand, pantWaist: pantWaist, pantLength: pantLength, bottom: bottom, front: front, shoes: shoes, shoeBrand: shoeBrand, shoes2: shoes2, shoes2Brand: shoes2Brand, lsShirtsNeck: lsShirtsNeck, lsBrand: lsBrand, ssShirtsNeck: ssShirtsNeck, ssBrand: ssBrand, coat: coat, coatBrand: coatBrand, birthday: birthday, pant: pant, sleeve: sleeve)
        saveToPersistentStore()
    }
    
    func update(missionary: Missionary, name: String, parents: String, address: String, city: String, state: String, zip: String, phone: String, parentsEmail: String, mission: String, mtcDate: Date, mtc: String, suit: String, suitBrand: String, pantWaist: String, pantLength: String, bottom: String, front: String, shoes: String, shoeBrand: String, shoes2: String, shoes2Brand: String, lsShirtsNeck: String, lsBrand: String, ssShirtsNeck: String, ssBrand: String, coat: String, coatBrand: String, birthday: Date, pant: String, sleeve: String) {
        missionary.name = name
        missionary.parents = parents
        missionary.address = address
        missionary.city = city
        missionary.state = state
        missionary.zip = zip
        missionary.phone = phone
        missionary.parentsEmail = parentsEmail
        missionary.mission = mission
        missionary.mtcDate = mtcDate
        missionary.mtc = mtc
        missionary.suit = suit
        missionary.suitBrand = suitBrand
        missionary.pantWaist = pantWaist
        missionary.pantLength = pantLength
        missionary.bottom = bottom
        missionary.front = front
        missionary.shoes = shoes
        missionary.shoeBrand = shoeBrand
        missionary.shoes2 = shoes2
        missionary.shoes2Brand = shoes2Brand
        missionary.lsShirtsNeck = lsShirtsNeck
        missionary.lsBrand = lsBrand
        missionary.ssShirtsNeck = ssShirtsNeck
        missionary.ssBrand = ssBrand
        missionary.coat = coat
        missionary.coatBrand = coatBrand
        missionary.birthday = birthday
        missionary.pant = pant
        missionary.sleeve = sleeve
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

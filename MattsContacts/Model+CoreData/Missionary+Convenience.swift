//
//  Missionary+Convenience.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/7/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation
import CoreData

extension Missionary {
    convenience init(name: String, lastName: String, lastVisit: Date? = nil, parents: String, address: String, city: String, state: String, zip: String, phone: String, parentsEmail: String, mission: String, mtcDate: Date?, mtc: String, notes: String, suit: String, suitBrand: String, pantWaist: String, pantLength: String, bottom: String, front: String, shoes: String, shoeBrand: String, shoes2: String, shoes2Brand: String, lsShirtsNeck: String, lsBrand: String, ssShirtsNeck: String, ssBrand: String, coat: String, coatBrand: String, birthday: Date?, pant: String, sleeve: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.lastName = lastName
        self.lastVisit = lastVisit
        self.parents = parents
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.phone = phone
        self.parentsEmail = parentsEmail
        self.mission = mission
        self.mtcDate = mtcDate
        self.mtc = mtc
        self.notes = notes
        self.suit = suit
        self.suitBrand = suitBrand
        self.pantWaist = pantWaist
        self.pantLength = pantLength
        self.bottom = bottom
        self.front = front
        self.shoes = shoes
        self.shoeBrand = shoeBrand
        self.shoes2 = shoes2
        self.shoes2Brand = shoes2Brand
        self.lsShirtsNeck = lsShirtsNeck
        self.lsBrand = lsBrand
        self.ssShirtsNeck = ssShirtsNeck
        self.ssBrand = ssBrand
        self.coat = coat
        self.coatBrand = coatBrand
        self.birthday = birthday
        self.pant = pant
        self.sleeve = sleeve
    }
}

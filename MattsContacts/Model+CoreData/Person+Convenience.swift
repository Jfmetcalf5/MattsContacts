//
//  Person+Convenience.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation
import CoreData

extension Person {
    convenience init(name: String, address: String, city: String, state: String, zip: String, phone: String, email: String, suit: String, suitBrand: String, pantWaist: String, pantLength: String, bottom: String, front: String, shoes: String, shoeBrand: String, shoes2: String, shoes2Brand: String, lsShirtNeck: String, lsBrand: String, ssShirtsNeck: String, ssBrand: String, coat: String, coatBrand: String, birthday: Date, sleeve: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.phone = phone
        self.email = email
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
        self.lsShirtsNeck = lsShirtNeck
        self.lsBrand = lsBrand
        self.ssShirtsNeck = ssShirtsNeck
        self.ssBrand = ssBrand
        self.coat = coat
        self.coatBrand = coatBrand
        self.birthday = birthday
        self.sleeve = sleeve
    }
}

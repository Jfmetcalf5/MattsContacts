//
//  PersonController.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation
import CoreData

class PersonController {
    
    static let shared = PersonController()
    
    var persons: [Person] = []
    
    func fetchPersons() {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        guard let fetchedPersons = (try? CoreDataStack.context.fetch(request)) else { return }
        let sortedPersons = fetchedPersons.sorted(by: {$0.lastName ?? "" < $1.lastName ?? ""})
        self.persons = sortedPersons
    }
    
    func createPerson(name: String, lastName: String, address: String, city: String, state: String, zip: String, phone: String, email: String, notes: String, suit: String, suitBrand: String, pantWaist: String, pantLength: String, bottom: String, front: String, shoes: String, shoeBrand: String, shoes2: String, shoes2Brand: String, lsShirtsNeck: String, lsBrand: String, ssShirtsNeck: String, ssBrand: String, coat: String, coatBrand: String, birthday: Date?, sleeve: String) {
        
        let _ = Person(name: name, lastName: lastName, address: address, city: city, state: state, zip: zip, phone: phone, email: email, notes: notes, suit: suit, suitBrand: suitBrand, pantWaist: pantWaist, pantLength: pantLength, bottom: bottom, front: front, shoes: shoes, shoeBrand: shoeBrand, shoes2: shoes2, shoes2Brand: shoes2Brand, lsShirtNeck: lsShirtsNeck, lsBrand: lsBrand, ssShirtsNeck: ssShirtsNeck, ssBrand: ssBrand, coat: coat, coatBrand: coatBrand, birthday: birthday, sleeve: sleeve)
        saveToPersistentStore()
    }
    
    func update(person: Person, name: String, lastName: String, address: String, city: String, state: String, zip: String, phone: String, email: String, notes: String, suit: String, suitBrand: String, pantWaist: String, pantLength: String, bottom: String, front: String, shoes: String, shoeBrand: String, shoes2: String, shoes2Brand: String, lsShirtsNeck: String, lsBrand: String, ssShirtsNeck: String, ssBrand: String, coat: String, coatBrand: String, birthday: Date?, sleeve: String) {
        person.name = name
        person.lastName = lastName
        person.address = address
        person.city = city
        person.state = state
        person.zip = zip
        person.phone = phone
        person.email = email
        person.notes = notes
        person.suit = suit
        person.suitBrand = suitBrand
        person.pantWaist = pantWaist
        person.pantLength = pantLength
        person.bottom = bottom
        person.front = front
        person.shoes = shoes
        person.shoeBrand = shoeBrand
        person.shoes2 = shoes2
        person.shoes2Brand = shoes2Brand
        person.lsShirtsNeck = lsShirtsNeck
        person.lsBrand = lsBrand
        person.ssShirtsNeck = ssShirtsNeck
        person.ssBrand = ssBrand
        person.coat = coat
        person.coatBrand = coatBrand
        person.birthday = birthday
        person.sleeve = sleeve
    }
    
    func fetchPersonsWith(searchTerm: String) {
        fetchPersons()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "mm/dd/yy"
        let searchedPersons = PersonController.shared.persons.filter{"\($0.name?.lowercased() ?? "") \($0.lastName?.lowercased() ?? "")".contains(searchTerm.lowercased()) || ("\(dateFormatter.string(from: $0.birthday ?? Date()).dropLast().dropLast().dropLast().dropLast().dropLast().dropLast())".contains(searchTerm.lowercased()))}
        self.persons = searchedPersons
    }
    
    func delete(person: Person) {
        if let moc = person.managedObjectContext {
            moc.delete(person)
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

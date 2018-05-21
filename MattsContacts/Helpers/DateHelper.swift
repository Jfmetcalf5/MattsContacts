//
//  DateHelper.swift
//  MattsContacts
//
//  Created by Jacob Metcalf on 5/21/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation

extension Date {
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}

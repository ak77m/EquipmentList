//
//  Date+Extensions.swift
//  EquipmentList
//
//  Created by ak77m on 28.04.2021.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
    
}

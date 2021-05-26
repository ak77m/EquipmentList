//
//  ELEqInfo+Extensions.swift
//  EquipmentList
//
//  Created by ak77m on 28.04.2021.
//

import Foundation
import CoreData

extension ELEqInfo: BaseModel {
    
    static func getInfoByCategoryId(_ id: NSManagedObjectID) -> [ELEqInfo] {
        guard let category = ELCategory.byId(id: id) as? ELCategory,
              let info = category.eqInfo
        else {
            return []
        }
        
        return (info.allObjects as? [ELEqInfo]) ?? []
    }
}

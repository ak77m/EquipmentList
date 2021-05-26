//
//  AddEqupmentVM.swift
//  EquipmentList
//
//  Created by ak77m on 05.05.2021.
//

#if os(iOS)
    import UIKit
#elseif os(iOS)
    import Foundation
#endif


import CoreData


class AddEqupmentVM: ObservableObject {
    
    var modelName: String = ""
    var serialNumber: String = ""
    var comment: String = ""
    var date: Date = Date()
    var isAvailable: Bool = true
    var photo: UIImage? = nil
    
    func addInfoToCategory(id: NSManagedObjectID) {
        
        let category: ELCategory? = ELCategory.byId(id: id)
        
        if let category = category {
            let info = ELEqInfo(context: ELEqInfo.viewContext)
            info.modelName = modelName
            info.serialNumber = serialNumber
            info.comment = comment
            info.date = Date()
            info.isAvailable = isAvailable
            info.addToCategories(category)
            #if os(iOS)
                if let img = photo { info.photo = img.jpegData(compressionQuality: 0.5) }
            #endif
            try? info.save()
        }
        
    }
    
}

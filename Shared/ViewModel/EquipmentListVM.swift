//
//  EquipmentListVM.swift
//  EquipmentList
//
//  Created by ak77m on 30.04.2021.
//

#if os(iOS)
    import UIKit
#elseif os(iOS)
    import Foundation
#endif

import CoreData

class EquipmentListVM: ObservableObject {
 
    @Published var equipments = [EquipmentVM]()
    
    func deleteEquipment(equipment: EquipmentVM) {
        let equipment: ELEqInfo? = ELEqInfo.byId(id: equipment.id)
        if let equipment = equipment {
            try? equipment.delete()
        }
    }
    
    func getInfoByCategory(vm: CategoryVM) {
            DispatchQueue.main.async {
                self.equipments = ELEqInfo.getInfoByCategoryId(vm.categoryId).map(EquipmentVM.init)
            }
        }
    
    func getAllEquipments() {
        DispatchQueue.main.async {
            self.equipments = ELEqInfo.all().map(EquipmentVM.init)
        }
    }
        
    
}

struct EquipmentVM {
    let equipment: ELEqInfo
    
    var id: NSManagedObjectID {
            return equipment.objectID
    }
    
    var modelName: String {
        return equipment.modelName ?? ""
    }
    
    var comment: String {
        return equipment.comment ?? ""
    }
    
    var serialNumber: String {
        return equipment.serialNumber ?? ""
    }
    
    var isAvailable: Bool {
        return equipment.isAvailable 
    }
    
    var photo: UIImage {
        guard let img = equipment.photo else { return UIImage(named: "nophoto")! }
        return  UIImage(data: img) ?? UIImage()
       
   }
    
    
}


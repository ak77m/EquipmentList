//
//  CategoryListVM.swift
//  EquipmentList
//
//  Created by ak77m on 28.04.2021.
//

import Foundation
import CoreData

class CategoryListVM: ObservableObject {
    
    @Published var categories = [CategoryVM]()
    
    func deleteCategory(category: CategoryVM) {
        let category: ELCategory? = ELCategory.byId(id: category.categoryId)
        if let category = category {
            try? category.delete()
        }
    }
    
    func getAllCategories() {
        DispatchQueue.main.async {
            self.categories = ELCategory.all().map(CategoryVM.init)
        }
    }
    
}

struct CategoryVM {
    
    let category: ELCategory
    
    var categoryId: NSManagedObjectID {
        return category.objectID
    }
    
    var categoryName: String {
        return category.categoryName ?? ""
    }
    
    var icon: String {
        return category.icon ?? ""
    }
    
}

// MARK: - VM for new record in ELCategory 
class AddCategoryVM: ObservableObject {
    
    var title: String = ""
    var icon: String = ""
    
    func save() {
        
        let newItem = ELCategory(context: ELCategory.viewContext)
        newItem.categoryName = title
        newItem.icon = icon
        
        try? newItem.save()
    }
    
}


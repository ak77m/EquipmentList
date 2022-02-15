//
//  CategoryListView.swift
//  EquipmentList
//
//  Created by ak77m on 28.04.2021.
//

import SwiftUI

struct CategoryListView: View {
    @StateObject private var categoryListVM = CategoryListVM()
    @State private var addCategorySheet: Bool = false
    @State private var codeScannerSheet: Bool = false
    @State var selection: CategoryVM? = nil
    
    var body: some View {
        
        VStack(alignment: .center) {
            List {
                ForEach(categoryListVM.categories, id: \.categoryId) { category in
                    NavigationLink (
                        destination: EquipmentListView(category: category),
                        label: {
                            CategoryCellView(icon: category.icon, categoryName: category.categoryName)
                        })
                        .contextMenu(menuItems: {
                            Button(action: {}) {
                                HStack {
                                    Text("Редактировать")
                                    Image(systemName: "pencil.circle")
                                }
                            }
                            Divider()
                            Button(action: {
                                if let index = self.categoryListVM.categories.firstIndex(where: { $0.categoryId == category.categoryId  })
                                {
                                    print("Список -----  \(index)")
                                    deleteCategory(at: [index])
                                    
                                }
                                
                            })
                            {
                                HStack {
                                    Text("Удалить")
                                    Image(systemName: "trash.circle")
                                }
                            }
                            
                            
                        })
                }
            
                .onDelete(perform: deleteCategory)
                
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
          
            .toolbar {
                Button(action: { codeScannerSheet = true }) {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.title3)
                }
                
                Divider()
                
                Button(action: { addCategorySheet = true }) {
                    Image(systemName: "folder.badge.plus")
                        .font(.title3)
                }
            }
            
        }
        .embedInNavigationView("Категории")
        
        
        
        .onAppear(perform: {
            categoryListVM.getAllCategories()
        })
        .sheet(isPresented: $addCategorySheet,
               onDismiss: {
                categoryListVM.getAllCategories()
               },
               content: { AddCategoryView()
        })
        
    }
    
    
    private func deleteCategory(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let category = categoryListVM.categories[index]
            categoryListVM.deleteCategory(category: category)
            categoryListVM.getAllCategories()
        }
    }
    
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}

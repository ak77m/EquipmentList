//
//  EquipmentListView.swift
//  EquipmentList
//
//  Created by ak77m on 29.04.2021.
//

import SwiftUI

struct EquipmentListView: View {
    
    
    @State private var addEquipmentSheet: Bool = false
    @StateObject private var equipmentList = EquipmentListVM()
    let category: CategoryVM
    
    
    var body: some View {
        
        
        
        List {
        
            Section(header: Text("Раздел \(category.categoryName)")) {
                ForEach(equipmentList.equipments, id: \.id) { equipment in
                    EquipmentCellView(equipment: equipment)
                }.onDelete(perform: deleteItem)
                
            }
            
            
            
        }.listStyle(PlainListStyle())
       
        .toolbar {
            ToolbarItem {
                HStack{
                    Button(action: {addEquipmentSheet = true}) {
                        Image(systemName: "plus.circle")
                            .font(.title3)
                    }

                    Button(action: {equipmentList.getAllEquipments()}) {
                        HStack{
                            //Text("Все")
                            Image(systemName: "list.bullet.rectangle")
                        }
                        .font(.title)
                    }
                }
            }
        }
        
        .onAppear(perform: {
            equipmentList.getInfoByCategory(vm: category)
        })
        
        .sheet(isPresented: $addEquipmentSheet,
               onDismiss: {
                equipmentList.getInfoByCategory(vm: category)
               },
               content: { AddEquipmentView(category: category)
        })
        
       
        
    }
   
    
    private func deleteItem(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let item = equipmentList.equipments[index]
            equipmentList.deleteEquipment(equipment: item)
            equipmentList.getInfoByCategory(vm: category)
        }
    }

    
}




struct DetailsEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let category = CategoryVM(category: ELCategory(context: CoreDataManager.shared.viewContext))
        EquipmentListView(category: category)
    }
}

//
//  EquipmentCellView.swift
//  EquipmentList
//
//  Created by ak77m on 11.05.2021.
//

import SwiftUI

struct EquipmentCellView: View {
    let equipment: EquipmentVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            
            VStack(alignment: .leading) {
                Text("Модель : \(equipment.modelName)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("S/N : \(equipment.serialNumber)")
            }
            .padding(.trailing)
            
            Text("Комментарий : \(equipment.comment)")
            
            Image(uiImage: equipment.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300, alignment: .center)
        }
        .padding(.horizontal)
    }
}

struct EquipmentCellView_Previews: PreviewProvider {
    static var previews: some View {
        let equipment = EquipmentVM(equipment: ELEqInfo(context: CoreDataManager.shared.viewContext))
        EquipmentCellView(equipment: equipment)
    }
}

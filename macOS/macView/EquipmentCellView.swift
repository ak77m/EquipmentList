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
        HStack {
            VStack(alignment: .leading, spacing: 10.0) {
                    Text("Модель : \(equipment.modelName)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                    Text("Сер. номер : \(equipment.serialNumber)")
                    Text("Дата обновления : \(equipment.dateUpdate)")
                    Spacer()
                    Text("Комментарий     : \(equipment.comment)")
                }
            .padding()
            Spacer()
            Image(nsImage: equipment.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, alignment: .center)
                .cornerRadius(5)
                .padding([.top, .bottom, .trailing])
        }
    }
}

struct EquipmentCellView_Previews: PreviewProvider {
    static var previews: some View {
        let equipment = EquipmentVM(equipment: ELEqInfo(context: CoreDataManager.shared.viewContext))
        EquipmentCellView(equipment: equipment)
    }
}

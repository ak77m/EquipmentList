//
//  EquipmentCellView.swift
//  EquipmentList
//
//  Created by ak77m on 11.05.2021.
//

import SwiftUI

struct EquipmentCellView: View {
    let equipment: EquipmentVM
    
    @State private var isAvailable = true
    var body: some View {
        HStack {
            Toggle("", isOn: $isAvailable)
            
            VStack (alignment: .leading, spacing: 15) {
                VStack(alignment: .leading) {
                    Text("Модель : \(equipment.modelName)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                    
                    Text("S/N : \(equipment.serialNumber)")
                }
                //Spacer()
                Text("Комментарий : \(equipment.comment)")
               
            }
            .padding(.trailing)
            
            //AsyncImage(url: <#T##URL?#>)
            Spacer()
            
            Image(nsImage: equipment.photo)
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                
        }
        .padding(.leading)
        .border(Color.gray, width: 1)
        .cornerRadius(5)
        .shadow(radius: 3)
        //.frame(minWidth: 400, maxWidth: .infinity)
    }
}

struct EquipmentCellView_Previews: PreviewProvider {
    static var previews: some View {
        let equipment = EquipmentVM(equipment: ELEqInfo(context: CoreDataManager.shared.viewContext))
        EquipmentCellView(equipment: equipment)
    }
}

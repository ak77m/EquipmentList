//
//  AddCategoryView.swift
//  EquipmentList
//
//  Created by ak77m on 21.04.2021.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.presentationMode) var presentationMode // Реализация возврата по кнопке
    @StateObject private var addCategoryVM = AddCategoryVM()
    private var iconSet = IconSet.all

    var body: some View {
        
        VStack {
            
            Form {
                Section (header: Text("Название группы устройств")) {
                    TextField("Категория",text: $addCategoryVM.title)
                }
                
                Section (header: Text("Пиктограмма")) {
                    Picker("",selection: $addCategoryVM.icon) {
                        ForEach(iconSet, id: \.self) {
                            Text($0)
                                .font(.title)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .padding()
            
            Divider()
            
            HStack(spacing: 40.0){
                Button("Отмена", action: {
                        presentationMode.wrappedValue.dismiss()})
                Spacer()
                Button("Добавить", action: {
                    if !addCategoryVM.title.isEmpty, !addCategoryVM.icon.isEmpty {
                        addCategoryVM.save()
                        presentationMode.wrappedValue.dismiss()
                    }
                })
            }
            .padding()
            .shadow(radius: 4, x: 4, y: 4)
            
            
            
            
            
        }
        .frame(minWidth: 300, maxWidth: 400, minHeight: 300, maxHeight: 400
               , alignment: .center)
        //.frame(width: 400, height: 500, alignment: .center)
        .padding()
        
        
        
        
        
    }
}

struct NewCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}

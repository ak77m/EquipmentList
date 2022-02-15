//
//  AddEquipmentView.swift
//  EquipmentList
//
//  Created by ak77m on 03.05.2021.
//

import SwiftUI

struct AddEquipmentView: View {
    
    @Environment(\.presentationMode) var presentationMode // Реализация возврата по кнопке
    
    let category: CategoryVM
    @StateObject private var equipmentVM = AddEquipmentVM()
    
    // Photo Capture. Only for iOS
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    @State private var myUiImage: UIImage? = nil
    
    var body: some View {
        VStack{
            Form {
                Section (header: Text("Устройство")) {
                    TextField("Название модели",text: $equipmentVM.modelName)
                    
                    HStack{
                        TextField("Сер. номер",text: $equipmentVM.serialNumber)
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "barcode.viewfinder")
                        })
                    }
                }
                
                Section (header: Text("Общая информация")) {
                    TextField("Комментарий",text: $equipmentVM.comment)
                }
                
                #if os(iOS)
                Section (header: Text("Фото")) {
                    
                    VStack{
                        HStack{
                            Text("Сделать снимок")
                            Spacer()
                            Button(action: { showImagePicker = true }, label: {
                                Image(systemName: "camera.viewfinder")
                            })
                            
                        }
                        
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                }
                #endif
                
            }
            .padding()
            
            HStack(spacing: 40.0){
                Button("Отмена", action: {
                        presentationMode.wrappedValue.dismiss()})
                Spacer()
                Button("Добавить", action: {
                    if !equipmentVM.modelName.isEmpty, !equipmentVM.modelName.isEmpty{
                        equipmentVM.photo = myUiImage
                        equipmentVM.addInfoToCategory(id: category.categoryId)
                        presentationMode.wrappedValue.dismiss()
                    }
                })
            }
            .padding()
            .shadow(radius: 4, x: 4, y: 4)
            
        }
        .sheet(isPresented: self.$showImagePicker, onDismiss: {
            
        }) {
            #if os(iOS)
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image, myUiImage: $myUiImage)
            #endif
        }
        
    }
}

struct AddEqupmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddEquipmentView(category: CategoryVM(category: ELCategory(context: ELCategory.viewContext)))
    }
}

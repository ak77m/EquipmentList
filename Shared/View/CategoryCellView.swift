//
//  DetailView.swift
//  EquipmentList
//
//  Created by ak77m on 21.04.2021.
//

import SwiftUI

struct CategoryCellView: View {
    //@ObservedObject var category: ELCategory
    //let category: CategoryVM
    @State var icon: String
    @State var categoryName: String
    
    var body: some View {
        HStack{
            Text(icon)
                .font(.system(size: 60))
            
            Text(categoryName)
                .font(.title)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
            Spacer ()
        }
        .padding()
        .frame(maxWidth: 280, maxHeight: 100)
        .aspectRatio(1.0, contentMode: .fill)
        .background(Color.red)
        .cornerRadius(8.0)
        //.shadow(color: .white, radius: 4.0)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        //let category = CategoryVM(category: ELCategory(context: CoreDataManager.shared.viewContext))
        CategoryCellView(icon: "📽", categoryName: "Текст")
            .previewLayout(.fixed(width: 400, height: 400))
    }
}

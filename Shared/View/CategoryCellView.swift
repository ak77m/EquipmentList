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
        ZStack {
            HStack(alignment: .center, spacing: 15.0){
                Text(icon)
                    .font(.system(size: 60))
                
                Text(categoryName)
                    .font(.title)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                Spacer ()
            }
            .padding(.horizontal)
            .frame(maxWidth: 280, maxHeight: 100)
            .aspectRatio(1.0, contentMode: .fill)
            .shadow(color: .black.opacity(0.5), radius: 4, x: 5, y: 5)
        
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color.init(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
        .cornerRadius(15.0)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        //let category = CategoryVM(category: ELCategory(context: CoreDataManager.shared.viewContext))
        CategoryCellView(icon: "📽", categoryName: "Текст")
            .previewLayout(.fixed(width: 400, height: 400))
    }
}

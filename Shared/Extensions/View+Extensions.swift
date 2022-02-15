//
//  View+Extensions.swift
//  EquipmentList
//
//  Created by ak77m on 28.04.2021.
//

import SwiftUI

extension View {
    func embedInNavigationView(_ text: String) -> some View {
        NavigationView {
            self
                .navigationTitle(text)
        }
    }
}

// MARK: -  Main page images modifier with custom shadow
extension Image {
    func customStyle() -> some View {
        self
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(15)
    }
}

// MARK: -  Main page images modifier with custom shadow
extension VStack {
    func macStyle(width: CGFloat) -> some View {
        self
          #if os(iOS)
            .frame( minWidth: width, maxWidth: .infinity,  alignment: .center)
            .cornerRadius(5)
          #endif
    }
}



// MARK: - Custom Color (for future)
extension Color {
    static let lightBackgroundColor = Color.init(#colorLiteral(red: 0.968627451, green: 0.9843137255, blue: 0.9882352941, alpha: 1))
    static let lightTextColor = Color.init(#colorLiteral(red: 0.968627451, green: 0.9843137255, blue: 0.9882352941, alpha: 1))
    static let darkBackgroundColor = Color.init(#colorLiteral(red: 0.8392156863, green: 0.9019607843, blue: 0.9490196078, alpha: 1))
    static let darkTextColor = Color.init(#colorLiteral(red: 0.7254901961, green: 0.8431372549, blue: 0.9176470588, alpha: 1))
}




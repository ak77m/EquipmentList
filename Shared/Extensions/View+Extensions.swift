//
//  View+Extensions.swift
//  EquipmentList
//
//  Created by ak77m on 28.04.2021.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView(_ text: String) -> some View {
        NavigationView {
            self
                .navigationTitle(text)
        }
    }
}

//
//  EquipmentListApp.swift
//  Shared
//
//  Created by ak77m on 21.04.2021.
//

import SwiftUI

@main
struct EquipmentListApp: App {
    
//    init() {
//        UITableView.appearance().separatorStyle = .none
//    }

    var body: some Scene {
        WindowGroup {
            CategoryListView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

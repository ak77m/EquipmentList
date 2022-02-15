//
//  EquipmentListApp.swift
//  EquipmentList (iOS)
//
//  Created by ak77m on 08.01.2022.
//

import SwiftUI

@main
struct EquipmentListApp: App {
    
//        init() {
//            UITableView.appearance().separatorStyle = .none
//        }
    
    var body: some Scene {
        WindowGroup {
            CategoryListView()
            //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.commands {
            CommandMenu("First menu") {
                Button("Print message") {
                    print("Hello World!")
                }.keyboardShortcut("p")
                
                Divider()
                
                Button("Print third message") {
                    print("Third message!")
                }
            }
        }
    }
}

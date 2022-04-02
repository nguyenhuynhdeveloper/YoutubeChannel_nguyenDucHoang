//
//  MyAppApp.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 27/03/2022.
//

import SwiftUI

@main
//App = protocol = "interface in Java"
struct MyAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //DetailProductView()
//            ProductListView()
//                .environmentObject(ProductRepository())
            //WelcomeShape()
            WelcomeView()
        }
    }
}

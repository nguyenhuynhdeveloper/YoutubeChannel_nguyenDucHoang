//
//  MyAppApp.swift
//  MyApp
//
//  Created by Nguyen Duc Hoang on 05/04/2022.
//

import SwiftUI

@main
struct MyAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //WelcomeView()
            LoginView()
        }
    }
}

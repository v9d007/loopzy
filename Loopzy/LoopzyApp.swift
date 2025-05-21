//
//  LoopzyApp.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 21/05/25.
//

import SwiftUI

@main
struct LoopzyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

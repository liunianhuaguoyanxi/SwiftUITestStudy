//
//  Expense_CoreDataApp.swift
//  Expense-CoreData
//
//  Created by 张伟 on 2023/3/5.
//

import SwiftUI

@main
struct Expense_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

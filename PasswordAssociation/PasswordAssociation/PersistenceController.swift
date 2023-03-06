//
//  PersistenceController.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/3/6.
//

import CoreData

let DataBaseName = "PasswordAssociationApp"

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let passwordItem =  PasswordItem(context: viewContext)
            passwordItem.id = UUID().uuidString
            passwordItem.name = "MacBook"
            passwordItem.type = ""
            passwordItem.price = "15000"
            passwordItem.account = ""
            passwordItem.password = ""
            passwordItem.updatedAt = Date()

        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: DataBaseName)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveViewContextIfChanged(){
        //检查有无变动，有变动则保存，一般退到后台用
        let viewContext = container.viewContext
        if viewContext.hasChanges{
            do {
                try viewContext.save()
            } catch  {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
            }
        }
    }
}

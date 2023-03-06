//
//  PasswordAssociationApp.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/20.
//

import SwiftUI

@main
struct PasswordAssociationApp: App {
    let persistenceController = PersistenceController.shared
    //实例化viewmodel的时候用stateobject，子页面接受传值那边用ObservedObject
    @StateObject var expense = PasswordAssociation()
//    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expense)
                .onChange(of: scenePhase) { newScenePhase in
                    switch newScenePhase{
                    case . background:
                        print("App进入后台")
                        persistenceController.saveViewContextIfChanged()
                    case.inactive:
                        print("App变成非活跃状态")
                    case.active:
                        print("App变成活跃状态")
                    @unknown default:
                        print("其余在未来系统追加的生命周期")
                    }

                }
//            //双向绑定，集合了environmentObject和@stateObject
//    ContentView().environment(\.managedObjectContext,persistenceController.container.viewContext)
            
////            AppStorageDemo()
//
//            ContentView()
//                .environmentObject(expense) //注入对象 一般在最外面注入 在父视图注入对象后，所有子视图都能通过environmentObject获取到该对象，并且有了更改后也会同步，相当于简化了StateObject
//            //什么是父子视图：整体页面的父子关系（进行了页面跳转就算父子，即父视图控制器和子视图控制器，但是swiftUI没有控制器的概念，所以只能这样理解）
//            //如navigationLink跳转 tabview切换 但是present不是父子关系在之前版本中
////            LabelDemo()
            ///
            ///
        }
    }
}

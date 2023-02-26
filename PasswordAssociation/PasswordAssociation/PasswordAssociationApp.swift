//
//  PasswordAssociationApp.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/20.
//

import SwiftUI

@main
struct PasswordAssociationApp: App {
    //实例化viewmodel的时候用stateobject，子页面接受传值那边用ObservedObject
    @StateObject var expense = PasswordAssociation()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expense) //注入对象 在父视图注入对象后，所有子视图都能通过environmentObject获取到该对象，并且有了更改后也会同步，相当于简化了StateObject
//            LabelDemo()
        }
    }
}
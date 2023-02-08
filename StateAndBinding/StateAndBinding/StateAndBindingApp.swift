//
//  StateAndBindingApp.swift
//  StateAndBinding
//
//  Created by 张伟 on 2023/1/11.
//

import SwiftUI

@main
struct StateAndBindingApp: App {
    @UIApplicationDelegateAdaptor private var appDelegete: AppDelegate
    var body: some Scene {
        WindowGroup {
//            ToggleView()
            TextFieldView()
        }
    }
}

class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        UIScrollView.appearance().keyboardDismissMode = .onDrag

        return true
    }
}

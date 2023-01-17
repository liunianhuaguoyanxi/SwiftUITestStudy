//
//  WeChatHomeViewApp.swift
//  WeChatHomeView
//
//  Created by 张伟 on 2022/12/31.
//

import SwiftUI

@main
struct WeChatHomeViewApp: App {
    
    //属性包装器property Wrapper
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    

    /*
    \.相当于当前系统
    \.colorScheme 相当于当前系统的颜色模式
     @Environment(\.colorScheme)取出当前系统的颜色模式
     @Environment(\.colorScheme) var colorScheme: ColorScheme 取出当前系统的颜色模式，并赋值给var出来的环境对象colorScheme
     
     
     @Environment(\.scenePhase) var scenePhase :ScenePhase
     @Environment(\.scenePhase) var scenePhase
     上下等价，因为系统可以自己推断出类型
     取出当前系统的状态，并赋值给var出来的环境对象scenePhase
     
     onChange 监控取出的属性，经常和environment配合使用
     如：
     WindowGroup {
         Home()
     }.onChange(of: scenePhase) { newScenePhase in
         switch newScenePhase{
             
         case .background:
             <#code#>
         case .inactive:
             <#code#>
         case .active:
             <#code#>
         @unknown default:
             <#code#>
         }
     }
     监控当前app的状态
    */
    
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            Home()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase{
                
            case .background:
                print("App进入后台了")
            case .inactive:
                print("App变成非活跃状态")
            case .active:
                print("App变成活跃状态")
            @unknown default:
                print("其余在未来系统追加的生命周期")
            }
        }
    }

}

class AppDelegate:NSObject,UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        config()
        
        return true
    }

    
    private func config(){
        let naviBarAppearance = UINavigationBarAppearance()
        naviBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = naviBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = naviBarAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        
        let tabBarItemAppearance =  UITabBarItemAppearance()
//            tabBarItemAppearance.normal.iconColor = UIColor(named: "WeChatGreen")
//            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(named: "WeChatGreen")!]
        tabBarItemAppearance.selected.iconColor = UIColor(named: "WeChatGreen")
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(named: "WeChatGreen")!,
                                                             NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11, weight: .medium)]
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}

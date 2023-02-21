//
//  HomeView.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/21.
//

import SwiftUI

struct HomeView: View {
    @State private var flag = true
    var body: some View {
        VStack{
            ContentView()
            Button(flag ? "刷新" :"再次刷新"){
                flag.toggle()
            }
        }
    }
    
    //重要
    //由flag引起的刷新不仅会刷新Button,也会影响同层级的ContentView，即也刷新它的视图
    //但是由@StateObject 修饰的不会刷新 不会重新被实例化
    //由@ObservedObject 修饰的会刷新 会重新被实例化
    //所以首次使用或者实例化对象就用@StateObject 仅仅传值就建议用ObservedObject
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

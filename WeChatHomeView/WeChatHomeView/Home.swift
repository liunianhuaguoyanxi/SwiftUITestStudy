//
//  Home.swift
//  WeChatHomeView
//
//  Created by 张伟 on 2023/1/4.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            MessageList()

            Text("通讯录页面")
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("通讯录")
                }
            Text("发现页面")
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("通讯录")
                }
            Text("我页面")
                .tabItem {
                    Image(systemName: "person")
                    Text("我")
                }
                    
            
        }.onAppear{

        }
    }
}


struct Previews_Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

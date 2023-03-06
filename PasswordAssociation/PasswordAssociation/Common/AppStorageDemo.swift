//
//  AppStorageDemo.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/3/5.
//

import SwiftUI

struct AppStorageDemo: View {
     //@State var nickName = ""
    @AppStorage("nickName") var nickName = ""
    //相当于@state和nsuserdefults的结合，能实时监控数据并通过nsuserdefult实时存放数据，但它只能存简单数据如intdouble这类，她的key就是nickName,但是它不是立刻存放的，可能会慢几秒才存放，主要目的是防止过度暴力写入.优化性能
    @AppStorage("isDarkMode") var isDarkMode = false
    var body: some View {
        Form{
            Section{
                TextField("输入昵称", text: $nickName)
                Text(nickName)
            }
            
            Section {
                Toggle("深浅色模式",isOn: $isDarkMode)
            }
        }
    }
}

struct AppStorageDemo_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageDemo()
    }
}

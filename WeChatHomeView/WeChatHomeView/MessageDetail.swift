//
//  MessageDetail.swift
//  WeChatHomeView
//
//  Created by 张伟 on 2023/1/4.
//

import SwiftUI

struct MessageDetail: View {
    let title :String
    
    var body: some View {
        Text("聊天页面")
            .navigationTitle(title)
    }
}


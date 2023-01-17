//
//  Message.swift
//  WeChatHomeView
//
//  Created by 张伟 on 2022/12/31.
//

import Foundation

struct Message :Identifiable {
//    var id = UUID()
    let id:Int
    let imageName: String
    let nickName :String
    let messageText: String
    let messageDate: String
}

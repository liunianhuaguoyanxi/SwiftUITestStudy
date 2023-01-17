//
//  MessageRow.swift
//  WeChatHomeView
//
//  Created by 张伟 on 2023/1/3.
//

import SwiftUI

struct MessageRow: View {
    
    let message:Message
    
    var body: some View {
        HStack(spacing: 10) {

            Image(message.imageName)
                .resizable()
                .scaledToFill()
            
                .frame(width: 50, height: 50)
//                    .clipped()
                .cornerRadius(3)
//                .border(.orange,width: 20)
//                .clipShape(Circle())
//                .overlay(
//                    Circle().stroke(.orange,lineWidth: 2)
//
//                )

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6){
                    Text(message.nickName)
                        .font(.system(size: 17))
                    Text(message.messageText)
                        .font(.system(size: 15))
                        .foregroundColor(.secondary )
                }
                Spacer()
                Text(message.messageDate)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }

        }
//            .padding([.top,.bottom],8)
//            .padding(.horizontal, 8)
        .padding(.vertical, 8)
//            .background(.gray)
    }
}



//
//  MessageList.swift
//  WeChatHomeView
//
//  Created by 张伟 on 2022/12/31.
//

import SwiftUI

struct MessageList: View {
    
    var meesages:[Message] = {
        var messages: [Message] = []
        for i in 1...30{
            let message = Message(id:i,imageName: "JackMa", nickName: "马云\(i)", messageText: "花呗还了吗\(i)", messageDate: "上午 6:00\(i)" )
            messages.append(message)
        }
                
         return messages
    }()
    
    
    
    var body: some View {

    NavigationStack {
        List (meesages) { message in
            ZStack{
                NavigationLink {
                    MessageDetail(title: message.nickName)
                } label: {
                    EmptyView()
                }.opacity(0)
                MessageRow(message: message)
            }


            
            
        }
        .listStyle(.plain)
        .navigationTitle("微信")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                
                print("111")
            } label: {
                Image(systemName: "plus.circle").foregroundColor(.primary)
            }.padding(.horizontal)
            //                ToolbarItem(placement: .navigationBarLeading) {
            //                    Button {
            //
            //                        print("111")
            //                    } label: {
            //                        Image(systemName: "plus.circle").foregroundColor(.primary)
            //                    }.padding(.horizontal)
            //                }
            //
            //                ToolbarItem(placement: .navigationBarTrailing) {
            //                    Button {
            //
            //                        print("111")
            //                    } label: {
            //                        Image(systemName: "plus.circle").foregroundColor(.primary)
            //                    }.padding(.horizontal)
            //                }
            //                ToolbarItemGroup(placement: .navigationBarLeading) {
            //                    Button {
            //
            //                        print("111")
            //                    } label: {
            //                        Image(systemName: "plus.circle").foregroundColor(.primary)
            //                    }
            //
            //                    Button {
            //
            //                        print("111")
            //                    } label: {
            //                        Image(systemName: "plus.circle").foregroundColor(.primary)
            //                    }
            //                    Button {
            //
            //                        print("111")
            //                    } label: {
            //                        Image(systemName: "plus.circle").foregroundColor(.primary)
            //                    }
            //                }
            //            }
        }

    }
    .tabItem {
        Image(systemName: "message.fill")
        Text("微信")
    }


    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
//            .preferredColorScheme(.dark)
    }
}

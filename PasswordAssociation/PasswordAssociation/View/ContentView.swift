//
//  ContentView.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/20.
//

import SwiftUI

//let expenseItems = [
//    PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//    PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//    PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333")
//]

struct ContentView: View {
    @State  private var isUnread = true
//    @State private var showDetailView = false
//    @State private var expenseItems = [
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333")
//    ]
//    @StateObject var expense = PasswordAssociation() //一开始申明属性要用 @StateObject
    
    @EnvironmentObject var expense:PasswordAssociation //已经在首页注入了，可以用这种方式取对象了，就不用@StateObject了获取了
    
    init() {
        print("刷新")
    }
    var body: some View {
        NavigationView {

            List(expense.expenseItems) { passwordItem in                    NavigationLink {
//                EditView(expense: expense,draftPasswordItem: DraftPasswordItem(passwordItem: passwordItem))
//                //                    DetailView(expenseItems: $expenseItems)
                //已经在首页注入了expense,就不用上面的方法来传值了
                EditView(draftPasswordItem: DraftPasswordItem(passwordItem:passwordItem))
            } label: {
                PasswordAssociationView(passwordItem: passwordItem)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button {
                    print("切换")
                } label: {
                    if isUnread{
                        //label可以给视力障碍的人提供语音
                        Label("标记已读", systemImage: "envelope.open")
                    }else
                    {
                        Label("标记已读", systemImage: "envelope.badge")
                        
                    }
                    
                }.tint(.blue)
                
                
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button(role: .destructive) {
                    print("删除账单")
                    expense.deleteItem(item: passwordItem)
                } label: {
                    Label("删除账单", systemImage: "trash")
                }
                
                Button {
                    print("标记账单")
                } label: {
                    Label("标记账单", systemImage: "flag")
                }
            }
                
            }



//                ForEach(expense.expenseItems){ passwordItem in
//                    NavigationLink {
//                          EditView(expense: expense,draftPasswordItem: DraftPasswordItem(passwordItem: passwordItem))
//    //                    DetailView(expenseItems: $expenseItems)
//                    } label: {
//                        HStack {
//                            VStack(alignment:.leading,spacing:4){
//                                Text(passwordItem.name).font(.headline)
//                                Text(passwordItem.type).font(.subheadline).foregroundColor(.secondary)
//                            }
//                            Spacer()
//                            Text(passwordItem.price)
//                        }
//                    }
//
//                }
//                .onDelete{ indexSet in  //.onDelete只存在于ForEach
//
//                    expense.deleteItem(indexSet: indexSet)
//                }


            
            .navigationTitle("账单")
            .toolbar {
                NavigationLink {
                    AddView()
//                    AddView(expense: expense)
                } label: {
                    Image(systemName: "plus").foregroundColor(.secondary)
                }.padding(.horizontal)

//                Button {
//                    showDetailView = true
//                } label: {
//                    Image(systemName: "plus").foregroundColor(.secondary)
//                }.padding(.horizontal)
                //控件多加点padding增大可点击区域
                
            }

        }
        .navigationViewStyle(.stack)
//        .environmentObject(expense) //注入到环境中 相当于全局使用，只有子视图才能这样用，如果是首页注入，一般在app最前面注入
        //present跳转
//       .sheet(isPresented: $showDetailView) { DetailView() }
//        .fullScreenCover(isPresented: $showDetailView) { } content: { DetailView()}

    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PasswordAssociation())
    }
}

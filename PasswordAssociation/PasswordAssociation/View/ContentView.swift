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
//    @State private var showDetailView = false
//    @State private var expenseItems = [
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333")
//    ]
    @StateObject var expense = PasswordAssociation() //一开始申明属性要用 @StateObject
    init() {
        print("刷新")
    }
    var body: some View {
        NavigationView {

            List{
                ForEach(expense.expenseItems){ passwordItem in
                    NavigationLink {

    //                    DetailView(expenseItems: $expenseItems)
                    } label: {
                        HStack {
                            VStack(alignment:.leading,spacing:4){
                                Text(passwordItem.name).font(.headline)
                                Text(passwordItem.type).font(.subheadline).foregroundColor(.secondary)
                            }
                            Spacer()
                            Text(passwordItem.price)
                        }
                    }

                }
                .onDelete{ indexSet in  //.onDelete只存在于ForEach
                    
                    expense.deleteItem(indexSet: indexSet)
                }


            }
            .navigationTitle("账单")
            .toolbar {
                NavigationLink {
                    
                    DetailView(expense: expense)
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
        //present跳转
//       .sheet(isPresented: $showDetailView) { DetailView() }
//        .fullScreenCover(isPresented: $showDetailView) { } content: { DetailView()}

    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  PasswordAssociation.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/21.
//

import Foundation

//值类型用$
//引用类型就不用$因为在内存中它指向的都是同一个
//viewModel 最好定义成class
class PasswordAssociation:ObservableObject { //协议：可观察
    
    
    @Published //@State升级版，主要用在ViewModel 它修饰的都需要是值类型，被公开发布的意思，之后会有别的地方被订阅来获取它
    var expenseItems = [
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333")
    ]
    init(){
        print("刷新呃呃")
    }
    
    func addItem(item:PasswordItem){
        expenseItems.append(item)
    }
    
    func deleteItem(indexSet: IndexSet){
        expenseItems.remove(atOffsets: indexSet)
    }
}

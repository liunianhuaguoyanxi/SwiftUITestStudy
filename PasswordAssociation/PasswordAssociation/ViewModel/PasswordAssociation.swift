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
class PasswordAssociation:ObservableObject  { //协议：可观察
    
//
    @Published
    //@State升级版，主要用在ViewModel 它修饰的都需要是值类型，被公开发布的意思，之后会有别的地方被订阅来获取它
    //修饰的所有都变成了binding类型，要用$
    //一旦有变化就立刻同时相关View刷新视图，这是强制性的
    var expenseItems = [
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333")
    ]
    init(){
        print("刷新呃呃")
    }
    
    func addItem(item:PasswordItem){
        expenseItems.append(item)
//        objectWillChange.send()    //手动添加，一旦有变化就立刻同时相关View刷新视图，
    }
    
//    func deleteItem(indexSet: IndexSet){
//        expenseItems.remove(atOffsets: indexSet)
////                objectWillChange.send()    //手动添加，一旦有变化就立刻同时相关View刷新视图，
//    }
    func deleteItem(item:PasswordItem){
        let index = expenseItems.firstIndex{$0.id == item.id}!
        expenseItems.remove(at: index)
//                objectWillChange.send()    //手动添加，一旦有变化就立刻同时相关View刷新视图，
    }
    
    func editItem(draftItem:DraftPasswordItem ){
        let index = expenseItems.firstIndex { $0.id == draftItem.id}!
        let expenseItem = PasswordItem(name: draftItem.name, type: draftItem.type, price: draftItem.price, account: draftItem.account, password: draftItem.password)
            expenseItems[index] = expenseItem

//        objectWillChange.send()
    }
    
    func updateHomeUI(){
        objectWillChange.send()
    }
//    @Published 和 objectWillChange.send() 都是通知视图刷新的
//@Published强制性全覆盖
//用objectWillChange.send()可以有选择性的指明
}

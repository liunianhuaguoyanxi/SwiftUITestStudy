//
//  PasswordAssociation.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/21.
//

import Foundation
import CoreData

//值类型用$
//引用类型就不用$因为在内存中它指向的都是同一个
//viewModel 最好定义成class
let kPasswordAssociationItemsKey = "PasswordAssociationItemsKey"
class PasswordAssociation:ObservableObject  { //协议：可观察
    let viewContext = PersistenceController.shared.container.viewContext

//
    @Published
    //@State升级版，主要用在ViewModel 它修饰的都需要是值类型，被公开发布的意思，之后会有别的地方被订阅来获取它
    //修饰的所有都变成了binding类型，要用$
    //一旦有变化就立刻同时相关View刷新视图，这是强制性的
    var expenseItems:[PasswordItem] = [
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333"),
//        PasswordItem(name: "京东", type: "购物", price: "800", account: "130", password: "333")
    ]

    init(){
        print(NSHomeDirectory())
        
        getItems()

    }
    func getItems(){
        //找到数据库所有的PasswordItem，并取出来
        let request = PasswordItem.fetchRequest()
        //根据updateAt字段 倒序排序
        request.sortDescriptors = [NSSortDescriptor(key: "updatedAt", ascending: false)]
        do {
          expenseItems =  try  viewContext.fetch(request)
        } catch {
             fatalError("从SQLite里面数据失败：\(error)")
        }
    }
    
    func addItem(name:String,type:String,price:String) {
        let expenseItem = PasswordItem(context: viewContext)
        expenseItem.id = UUID().uuidString
        expenseItem.name = name
        expenseItem.type = type
        expenseItem.price = price
        expenseItem.account  = ""
        expenseItem.password = ""
        expenseItem.updatedAt = Date()

        saveViewContext()
        
        getItems()
    }
    
    func deleteItem(item:PasswordItem){
        viewContext.delete(item)
        saveViewContext()
        getItems()

    }
    
    func editItem(draftItem:DraftPasswordItem ){
        let index = expenseItems.firstIndex { $0.id == draftItem.id}!
        let expenseItem = expenseItems[index]
        expenseItem.name = draftItem.name
        expenseItem.type = draftItem.type
        expenseItem.price = draftItem.price
        expenseItem.account = draftItem.account
        expenseItem.password = draftItem.password
        expenseItem.updatedAt = Date()
        saveViewContext()
        getItems()
    }
    
    
    
    
    
//    func addItem(item:PasswordItem){
////        expenseItems.append(item)
////        objectWillChange.send()    //手动添加，一旦有变化就立刻同时相关View刷新视图，
//
//
////        saveDataToUserDefaluts()
//    }
    
//    func deleteItem(indexSet: IndexSet){
//        expenseItems.remove(atOffsets: indexSet)
////                objectWillChange.send()    //手动添加，一旦有变化就立刻同时相关View刷新视图，
//    }
//    func deleteItem(item:PasswordItem){
//        let index = expenseItems.firstIndex{$0.id == item.id}!
//        expenseItems.remove(at: index)
////                objectWillChange.send()    //手动添加，一旦有变化就立刻同时相关View刷新视图，
//
////        saveDataToUserDefaluts()
//    }
    
//    func editItem(draftItem:DraftPasswordItem ){
//        let index = expenseItems.firstIndex { $0.id == draftItem.id}!
//        let expenseItem = PasswordItem(name: draftItem.name, type: draftItem.type, price: draftItem.price, account: draftItem.account, password: draftItem.password)
//            expenseItems[index] = expenseItem
//
////        objectWillChange.send()
//
////        saveDataToUserDefaluts()
//    }
    
    func updateHomeUI(){
        objectWillChange.send()
    }
//    @Published 和 objectWillChange.send() 都是通知视图刷新的
//@Published强制性全覆盖
//用objectWillChange.send()可以有选择性的指明
    
    //UserDefaults
    //    init(){
    //        print("刷新呃呃")
    //        print(NSHomeDirectory())
    //        if let data = UserDefaults.standard.data(forKey: kPasswordAssociationItemsKey){
    //            if let tmpPasswordAssociationItems = try? JSONDecoder().decode([PasswordItem].self, from: data){
    //                self.expenseItems = tmpPasswordAssociationItems
    //            } else {
    //                print("解码失败")
    //            }
    //        }
    //    }
}


//extension PasswordAssociation{
//    func saveDataToUserDefaluts()  {
//        do {
//            let data = try JSONEncoder().encode(expenseItems)
//            UserDefaults.standard.set(data, forKey: kPasswordAssociationItemsKey)
//        } catch {
//            print("编码错误：\(error)")
//        }
//    }
//}
extension PasswordAssociation
{
    func saveViewContext(){
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError),\(nsError.userInfo)")
        }
    }
}

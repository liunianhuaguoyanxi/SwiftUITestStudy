////
////  DetailView.swift
////  PasswordAssociation
////
////  Created by 张伟 on 2023/2/20.
////
//
//import SwiftUI
//
//struct DetailView: View {
//    //private
//    private let types = ["日用百货","餐饮美食","数码电器","教育培训","充值缴费"]
//    //    @Binding var expenseItems:[PasswordItem]
//    @State private var name = ""
//    @State private var type = "日用百货"
//    @State private var price = ""
//    @Environment(\.dismiss) var dismiss //从系统环境获取dismiss行为
//    
//    //可以被传过的数据
//    @ObservedObject var expense:PasswordAssociation  //获取值用ObservedObject 去观察 可观察到
//    var expenseItem: PasswordItem?
//    
//    //计算属性
//    var isAddingPage: Bool { expenseItem == nil }
//    var expenseItemIndex: Int?{
////        expense.expenseItems.firstIndex { PasswordItem inself.expenseItem?.id == PasswordItem.id}
//    //循环expense.expenseItems，并比对其元素的属性是否和expenseItem?.id一样，如一样则返回该元素的index
//        expense.expenseItems.firstIndex { $0.id == expenseItem?.id}
//    }
//    var body: some View {
////父控件有了NavigationView了子控件就不需要再用了
////        NavigationView{
//            
//            Form{
//                Section("账单名") {
//                    TextField("收入或者支出来源",text:isAddingPage ? $name : $expense.expenseItems[expenseItemIndex!].name)
//                }
//                Section("账单分类"){
//                    Picker("选择一个分类", selection:isAddingPage ? $type :$expense.expenseItems[expenseItemIndex!].type){
//                        ForEach(types,id:\.self){
//                            Text($0)//$0指每个循环出来的元素
//                        }
//                    }
//                }
//                Section("账单金额"){
//                    TextField("收入或者支出了多少", text:isAddingPage ? $price :$expense.expenseItems[expenseItemIndex!].price)
//                        .keyboardType(.numberPad)
//                }
//            }
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarTitle(isAddingPage ? "添加账单" : "编辑账单")
//            .navigationBarBackButtonHidden(true)//隐藏原生返回按钮
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        if isAddingPage {
//                            expense.addItem(item:  PasswordItem(name: name, type: type, price: price, account: "130", password: "333"))
//                        }else{
//                            expense.editItem()
//                        }
//
////                        expense.expenseItems.append(  PasswordItem(name: name, type: type, price: price, account: "130", password: "333"))
//                    dismiss()//swiftUI中既可以把present的dismiss也可以把push的pop回去
//                    } label: {
//                        Text("保存").foregroundColor(.primary)
//                    }
//                    .padding(.horizontal)
//                }
//
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                    dismiss()//swiftUI中既可以把present的dismiss也可以把push的pop回去
//                    } label: {
//                        Image(systemName: "arrow.left").foregroundColor(.primary)
//                    }
//                    .padding(.horizontal)
//                }
//            }
//
//    }
//
//}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(expense: PasswordAssociation(),expenseItem: PasswordItem(name: "234", type: "er", price: "100", account: "144", password: "3434"))
//    }
//}

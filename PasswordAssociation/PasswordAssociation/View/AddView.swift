//
//  AddView.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct AddView: View {
    //private
    private let types = ["日用百货","餐饮美食","数码电器","教育培训","充值缴费"]
    //    @Binding var expenseItems:[PasswordItem]
    @State private var name = ""
    @State private var type = "日用百货"
    @State private var price = ""
    @Environment(\.dismiss) var dismiss //从系统环境获取dismiss行为
    
    //可以被传过的数据
//    @ObservedObject var expense:PasswordAssociation  //获取值用ObservedObject 去观察 可观察到
    
    @EnvironmentObject var expense:PasswordAssociation
    //在需要使用该对象的子视图写这句话 就能获取全局对象 被传过的数据
    
    var body: some View {
        Form{
            Section("账单名") {
                TextField("收入或者支出来源",text:$name)
            }
            Section("账单分类"){
                Picker("选择一个分类", selection:$type){
                    ForEach(types,id:\.self){
                        Text($0)//$0指每个循环出来的元素
                    }
                }
            }
            Section("账单金额"){
                TextField("收入或者支出了多少", text:$price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("添加账单")
        .navigationBarBackButtonHidden(true)//隐藏原生返回按钮
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    expense.addItem(name: name, type: type, price: price)
//                    expense.addItem(item:  PasswordItem(name: name, type: type, price: price, account: "130", password: "333"))

//                        expense.expenseItems.append(  PasswordItem(name: name, type: type, price: price, account: "130", password: "333"))
                dismiss()//swiftUI中既可以把present的dismiss也可以把push的pop回去
                } label: {
                    Text("保存").foregroundColor(.primary)
                }
                .padding(.horizontal)
            }

            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                dismiss()//swiftUI中既可以把present的dismiss也可以把push的pop回去
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

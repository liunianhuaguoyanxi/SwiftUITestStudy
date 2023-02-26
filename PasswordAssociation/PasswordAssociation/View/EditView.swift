//
//  EditView.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct EditView: View {
    
    //private
    private let types = ["日用百货","餐饮美食","数码电器","教育培训","充值缴费"]
    @Environment(\.dismiss) var dismiss //从系统环境获取dismiss行为
    
    //可以被传过的数据
//    @ObservedObject var expense:PasswordAssociation  //获取值用ObservedObject 去观察 可观察到
    @EnvironmentObject var expense:PasswordAssociation //因为父视图已经注入了，这里就不用@observedObject来获取了
    
    @ObservedObject var draftPasswordItem: DraftPasswordItem

    //计算属性

    var body: some
    View {
        //父控件有了NavigationView了子控件就不需要再用了
        //        NavigationView{
                    
                    Form{
                        Section("账单名") {
                            TextField("收入或者支出来源",text:$draftPasswordItem.name)
                        }
                        Section("账单分类"){
                            Picker("选择一个分类", selection:$draftPasswordItem.type){
                                ForEach(types,id:\.self){
                                    Text($0)//$0指每个循环出来的元素
                                }
                            }
                        }
                        Section("账单金额"){
                            TextField("收入或者支出了多少", text:$draftPasswordItem.price)
                                .keyboardType(.numberPad)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle("编辑账单")
                    .navigationBarBackButtonHidden(true)//隐藏原生返回按钮
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {

                                expense.editItem(draftItem: draftPasswordItem)
                                

        //                        expense.expenseItems.append(  PasswordItem(name: name, type: type, price: price, account: "130", password: "333"))
                                
 
                            dismiss()//swiftUI中既可以把present的dismiss也可以把push的pop回去
                            } label: {
                                Text("保存").foregroundColor(.primary)
                            }
                            .padding(.horizontal)
                        }

                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                expense.updateHomeUI()
                            dismiss()//swiftUI中既可以把present的dismiss也可以把push的pop回去
                            } label: {
                                Image(systemName: "arrow.left").foregroundColor(.primary)
                            }
                            .padding(.horizontal)
                        }
                    }
    }
}


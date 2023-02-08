//
//  TextFieldView.swift
//  StateAndBinding
//
//  Created by 张伟 on 2023/1/16.
//

import SwiftUI

struct TextFieldView: View {
    enum Field: Hashable{
        case name,phone,address
    }
    
    @State private var name = "23"
    @State private var phone = ""
    @State private var address = ""
    @State private var addressLabelIndex = 0
    @State private var showAlert = false
    
    //键盘焦点
    @FocusState private var isFocused:Field?
    
    let addressLabels = ["家","公司","学校"]
    var confirmMsg:String{
        """
        收货人是：\(name)
        手机是：\(phone)
        地址是：\(address)
        标签是：\(addressLabels[addressLabelIndex])
        """
    }
    
    
    var invalidInput: Bool {
        name.isEmpty || phone.isEmpty || address.isEmpty
    }
    var body: some View {
        NavigationView {
            Form{
                Section{
                    HStack {
                        Text("收货人:")
                        TextField("请输入收货人姓名", text:$name)
                            .focused($isFocused,equals: .name)
                    }
                    HStack {
                        Text("手机号:")
                        TextField("请输入收货人手机号", text:$phone).keyboardType(.numberPad)
                            .focused($isFocused,equals: .phone)
                    }
                    HStack {
                        Text("详细地址:")
                        TextField("请输入收货人地址", text:$address)
                            .focused($isFocused,equals: .address)
                    }
                }
                Section{
                    Picker("标签", selection: $addressLabelIndex) {
//                        ForEach(addressLabels,id: \.self) { addressLabel in
//                            Text(addressLabel)
//                        }
//                        ForEach(0..<addressLabels.count, id: \.self) { index in
//                            Text(addressLabels[index])
//                        }
                        ForEach(addressLabels.indices,id:\.self){
                            index in
                            Text(addressLabels[index])
                        }

//                        Text("家").tag(0)
//                        Text("公司").tag(1)
//                        Text("学校").tag(2)

                    }
//                    Text("\(addressLabel)")
                }
                header: {
                    Text("标签")
                }
                .pickerStyle(.segmented)
                
                Section{
                    Button("选好了"){
                        if name.isEmpty{
                            isFocused = .name
                        }
                        else if phone.isEmpty{
                            isFocused = .phone
                        }
                        else if address.isEmpty{
                            isFocused = .address
                        }
                        else{
                            showAlert = true
                            isFocused = nil
                            print("用户输入没有问题，可以提交至服务器")
                        }
                        
                    }
    //                .disabled(invalidInput)
                }
            }
            .navigationTitle("新增收货地址")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("完成") {
                        isFocused = nil
                    }
                }
            }


        }
        .navigationViewStyle(.stack)
        .alert("xx", isPresented: $showAlert) {
            Text("3")
            Button("取消", role: .cancel) { }
        } message: {
            Text(confirmMsg)
        }//alert可以放到任何地方

        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                isFocused = .name
            }

        }
    }
    
//l
}


struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}

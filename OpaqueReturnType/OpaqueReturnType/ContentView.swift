//
//  ContentView.swift
//  OpaqueReturnType
//
//  Created by 张伟 on 2023/2/20.
//

import SwiftUI

//不透明返回类型OpaqueReturnType
struct ContentView: View {
//    ≈
//因为body类型会跟随申明的内容而动态改变返回的类型，如下实际返回类型为ModifiedContent<Button<Text>, _PaddingLayout>
//而用some view相当于返回泛型，即返回某种view，这样一来不直接指明返回类型，可以方便开发者开发
    var body: some View {
        Button("xx") {
            print(type(of: self.body))
        }.padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

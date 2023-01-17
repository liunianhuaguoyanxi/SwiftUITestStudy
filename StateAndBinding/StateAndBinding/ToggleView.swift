//
//  ToggleView.swift
//  StateAndBinding
//
//  Created by 张伟 on 2023/1/16.
//

import SwiftUI

struct ToggleView: View {
    @State private var isOn = true
    var body: some View {
        Toggle("深色模式", isOn: $isOn).padding()
//        if isOn{
//            print("s")
//        } else{
//            print("q")
//        }
//        Toggle(isOn: <#T##Binding<Bool>#>, label: <#T##() -> View#>)
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}

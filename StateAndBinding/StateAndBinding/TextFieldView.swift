//
//  TextFieldView.swift
//  StateAndBinding
//
//  Created by 张伟 on 2023/1/16.
//

import SwiftUI

struct TextFieldView: View {
    @State private var name = "23"
    var body: some View {
        //        TextField("text", text: $name)
        //            .font(.title).padding()
        Form{
            TextField(text: $name, prompt: Text("3")) {
                Text("rewr")
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}

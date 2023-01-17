//
//  ContentView.swift
//  MacStateAndBinding
//
//  Created by 张伟 on 2023/1/16.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "ff"
    var body: some View {
        Form {
            TextField(text: $name, prompt: Text("3")) {
                Text("rewr")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  AstronautView.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/5.
//

import SwiftUI

struct AstronautView: View {
    let astronautVM = AstronautVM()
    let name : String
    
    var astronaut: Astronaut{
        astronautVM.astronauts.first{
            $0.name == name
        }!
    }
    var body: some View {
        ScrollView{
            Image(astronaut.name)
                .resizable()
                .scaledToFit()
            Text(astronaut.description)
                .padding()
        }
        .background(kDarkBGColor)
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautView(name: "杨利伟")
    }
}

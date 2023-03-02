//
//  ContentView.swift
//  shenzhou
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct ContentView: View {
    let planVM = PlanVM()
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
//        Text(planVM.plans[0].name)

        NavigationView{
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(planVM.plans) { plan in
                        NavigationLink {
                            Text("3")
                        } label: {
                            VStack{
                                Image(plan.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                    .padding()
                                VStack{
                                    Text(plan.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(plan.launchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth:.infinity )
                                .background(kLightBGColor)
                            }
//                            .border(kLightBGColor,width: 10)
                            .cornerRadius(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(kLightBGColor)
                            }
                        }
                    }

                }
                .padding([.horizontal,.bottom])
            }
            .navigationTitle("神舟飞船")
            .background(kDarkBGColor)
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

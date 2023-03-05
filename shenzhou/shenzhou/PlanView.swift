//
//  PlanView.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/5.
//

import SwiftUI

struct PlanView: View {
    let plan: Plan
    var body: some View {
        GeometryReader{ proxy in
            ScrollView {
                LazyVStack{
                    Image(plan.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.6)
                        .padding(.top)
                    
                    //简介
                    VStack(alignment: .leading){
                        SZDvider()
                        
                        
                        Text("任务简介").modifier(BoldTitleWithPadding(edges: .bottom))
                        Text(plan.description)
                           
                        SZDvider()
                        if plan.members != nil {
                            Text("宇航员").boldTitleWithPadding()
                        }
                        
                    }
                    .padding(.horizontal)
                    if let members = plan.members {
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(members,id: \.name ) { member in
                                    NavigationLink {
                                        AstronautView(name: member.name)
                                    } label: {
                                        HStack {
                                            Image(member.name)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 104,height: 72)
                                                .clipShape(Capsule())//裁剪成除了圆角之外的效果，最好用这个
                                                .overlay {
                                                    Capsule()
                                                        .strokeBorder(.white)
                                                }
                                            VStack(alignment: .leading){
                                                Text(member.name)
                                                    .foregroundColor(.white).font(.headline)
                                                Text(member.birth)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                }
                .padding(.bottom)
            }
            
        }
        .navigationTitle(plan.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(kDarkBGColor)
    }
}

struct PlanView_Previews: PreviewProvider {
    static let plan = PlanVM().plans[12] //要用静态属性描述
    static var previews: some View {
        PlanView(plan: plan).preferredColorScheme(.dark)
    }
}

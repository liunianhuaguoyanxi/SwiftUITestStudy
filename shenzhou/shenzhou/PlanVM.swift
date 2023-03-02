//
//  PlanVM.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/2.
//

import Foundation
class PlanVM {
    var plans: [Plan]
    init() {
        guard let url = Bundle.main.url(forResource: "plans", withExtension: "json") else{
            fatalError("没在项目里面找到plans文件")//如果失败则闪退并打印内容
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("加载plans文件失败")
        }
        
        let decoder = JSONDecoder()
        
        guard let plans = try? decoder.decode([Plan].self, from: data) else{
            fatalError("plans文件JSON解码失败")
        }
        
        self.plans = plans
    }
}

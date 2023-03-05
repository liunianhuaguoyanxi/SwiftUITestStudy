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
        plans = Bundle.main.decide(file:kPlansJsonFile)
    }
}

//let plans: [Plan] = Bundle.main.decide(file:"plans")

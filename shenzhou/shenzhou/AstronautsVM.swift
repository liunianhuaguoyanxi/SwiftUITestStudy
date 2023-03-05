//
//  AstronautsVM.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/5.
//

import Foundation

class AstronautVM{
    var astronauts:[Astronaut]
    init() {
        astronauts = Bundle.main.decide(file:kAstronautsJsonFile)
    }
}

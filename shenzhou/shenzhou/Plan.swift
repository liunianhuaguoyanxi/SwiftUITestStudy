//
//  Plan.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/2.
//

import Foundation
//"id": 9,
//"name":"神舟九号",
//"launchDate":"2012年6月16日",
//"members":[
//    {
//        "name":"景海鹏",
//        "birth":"1966年10月24日"
//    },
//    {
//        "name":"刘旺",
//        "birth":"1969年3月"
//    },
//    {
//        "name":"刘洋",
//        "birth":"1978年10月6日"
//    }
//],
//"description":"搭载三人，首次搭载女宇航员，手动与天宫一号交会对接，进驻进行空间实验",
//"hasBadge":true
struct Plan:Codable,Identifiable{
    let id:Int
    let name:String
    let launchDate:String
    let description:String
    let hasBadge:Bool
    let members:[Member]?
    
    struct Member:Codable{
        let name:String
        let birth:String
    }
    
    var imageName:String{ hasBadge ? "shenzhou\(id)" : "placeholder" }
}

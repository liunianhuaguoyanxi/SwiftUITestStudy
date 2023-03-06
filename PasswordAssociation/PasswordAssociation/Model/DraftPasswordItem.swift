//
//  DraftPasswordItem.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/26.
//

import Foundation

class DraftPasswordItem:ObservableObject {
//    @Published   var id = UUID()
    @Published    var id : String
    @Published    var name: String
    @Published    var type: String
    @Published    var price: String
    
    
    @Published  var account: String
    @Published  var password: String
    
    init(passwordItem: PasswordItem){
//        print("sdf")
        id = passwordItem.id!
        name = passwordItem.name!
        type = passwordItem.type!
        price = passwordItem.price!
        account = passwordItem.account!
        password = passwordItem.password!
    }
}

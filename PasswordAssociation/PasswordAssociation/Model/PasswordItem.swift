//
//  PasswordItem.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/20.
//

import Foundation
struct  PasswordItem: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var price: String
    
    
    var account: String
    var password: String
}




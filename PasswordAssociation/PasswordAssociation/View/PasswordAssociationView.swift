//
//  PasswordAssociationView.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct PasswordAssociationView: View {
    @ObservedObject var passwordItem:PasswordItem
    var body: some View {
        HStack {
            VStack(alignment:.leading,spacing:4){
                Text(passwordItem.name ?? "").font(.headline)
                Text(passwordItem.type ?? "").font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
            Text(passwordItem.price ?? "")
        }
    }
}

//struct PasswordAssociationView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordAssociationView()
//    }
//}

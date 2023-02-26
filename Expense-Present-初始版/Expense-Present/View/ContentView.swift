//
//  ContentView.swift
//  Expense-Present
//
//  Created by Lebus on 2022/5/10.
//

import SwiftUI

struct ContentView: View {
    @State private var showEditView = false
    @State private var draftExepnseItem = ExpenseItem(name: "Lebus的教程", type: "教育培训", price: "800")
    @StateObject var expense = Expense()
    var body: some View {
        NavigationView {
            List {
                ForEach(expense.expenseItems) { expenseItem in
                    Button {
                        draftExepnseItem = expenseItem
                        showEditView = true
                    } label: {
                        ExpenseItemView(expenseItem: expenseItem)
                    }
                    .foregroundColor(.primary)
                }
            }.navigationTitle("账单")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showEditView) { EditView(expense: expense,draftExpenseItem: $draftExepnseItem) } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

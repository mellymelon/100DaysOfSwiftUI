//
//  AddView.swift
//  iExpense
//
//  Created by Yong Liang on 2/23/21.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    let types = ["公司", "个人"]

    var body: some View {
        NavigationView {
            Form {
                TextField("名字", text: $name)
                Picker("类型", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("数额", text: $amount)
                    .keyboardType(.numberPad)
            }.navigationBarTitle("添加新支出")
                .navigationBarItems(trailing: Button("保存") {
                        if let actualAmount = Int(amount) {
                            let item = ExpenseItem(name: name, type: type, amount: actualAmount)
                            expenses.items.append(item)
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}

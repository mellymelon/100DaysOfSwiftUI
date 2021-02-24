//
//  ContentView.swift
//  iExpense
//
//  Created by Yong Liang on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showAddView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }.onDelete(perform: removeItems)
            }.sheet(isPresented: $showAddView) {
                AddView(expenses: expenses)
            }
                .navigationBarTitle("iExpense")
                .navigationBarItems(trailing: Button(action: {
                        self.showAddView = true
                }) {
                        Image(systemName: "plus")
                    })
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encodedItems = try? encoder.encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decodedItems
                return
            }
        }
        self.items = []
    }
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Yong Liang on 2/25/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: Ship.entity(), sortDescriptors: []) var ships: FetchedResults<Ship>
    @State private var lastNameFilter = "A"

    var body: some View {
        VStack {
//            List(wizards, id: \.self) { wizard in
//                Text(wizard.name ?? "Unknown")
//            }
//            Button("Add") {
//                let wizard = Wizard(context: viewContext)
//                wizard.name = "Harry Potter"
//            }
//            Button("Save") {
//                do {
//                    try viewContext.save()
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown name")
//            }
//
//            Button("Add Examples") {
//                let ship1 = Ship(context: viewContext)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Trek"
//
//                let ship2 = Ship(context: viewContext)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Trek"
//
//                let ship3 = Ship(context: viewContext)
//                ship3.name = "Millennium Falcon"
//                ship3.universe = "Star Wars"
//
//                let ship4 = Ship(context: viewContext)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//
//                try? viewContext.save()
//            }

//            Button("Add Examples") {
//                let taylor = Singer(context: viewContext)
//                taylor.firstName = "Taylor"
//                taylor.lastName = "Swift"
//
//                let ed = Singer(context: viewContext)
//                ed.firstName = "Ed"
//                ed.lastName = "Sheeran"
//
//                let adele = Singer(context: viewContext)
//                adele.firstName = "Adele"
//                adele.lastName = "Adkins"
//
//                try? viewContext.save()
//            }
            FilteredList(filter: lastNameFilter)

            Button("Show A") {
                lastNameFilter = "A"
            }

            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

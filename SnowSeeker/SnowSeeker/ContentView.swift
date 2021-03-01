//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Yong Liang on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink(destination: ResortView(resort:resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    VStack(alignment: .leading) {
                        Text(resort.name)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
            }.navigationBarTitle("Resorts")
            WelcomeView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

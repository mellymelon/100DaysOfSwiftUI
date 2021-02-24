//
//  AstronautView.swift
//  Moonshot
//
//  Created by Yong Liang on 2/23/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    Text(astronaut.description)
                        .padding()
                        .layoutPriority(1) //比Image默认的0大，利用剩余的空间，防止文字过长省略号
                }
            }.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}

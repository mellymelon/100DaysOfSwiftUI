//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yong Liang on 2/17/21.
//

import SwiftUI

struct GridStack<Content:View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    let text1 = CapsuleText(text: "Gryffindor")
    let text2 = Text("Hufflepuff")

    var body: some View {
        GridStack(rows: 9, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

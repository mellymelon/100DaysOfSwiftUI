//
//  ContentView.swift
//  Animation
//
//  Created by Yong Liang on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var scaleAmount: CGFloat = 1
    @State private var rotationDegree = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var showRectangle = false
    let letters = Array("Hello SwiftUI")

    var body: some View {
        print(scaleAmount)
        return VStack {
            Button("Click") {
//                self.animationAmount+=1
                withAnimation {
                    self.rotationDegree += 360
                }
            }
                .padding(40)
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.green)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
                )
                .rotation3DEffect(
                        .degrees(rotationDegree),
                    axis: (x: 0.0, y: 1, z: 0.0)
                )
                .onAppear { self.animationAmount = 2 }
            Spacer()
            //双向绑定的同时也有了动画效果
            Stepper("Scale amount", value: $scaleAmount.animation(), in: 1...10)
            Spacer()
            Button("Tap Me") {
                //不会触发动画，除非加了withAnimation
                self.scaleAmount += 1
            }
                .padding(40)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(scaleAmount)
            Button("Click") {
                self.enabled.toggle()
            }
                .frame(width: 200, height: 200)
                .background(self.enabled ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                .animation(.default)
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(self.enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount = $0.translation }
                        .onEnded { _ in
                            self.dragAmount = .zero
                            self.enabled.toggle()
                    }
                )
            Button("显示长方形") {
                withAnimation {
                    self.showRectangle.toggle()
                }
            }
            if showRectangle {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
//                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                .transition(.pivot)
            }
        }
    }
}

//自定义modifier
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
            .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

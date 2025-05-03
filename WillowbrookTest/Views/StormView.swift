//
//  StormView.swift
//  WordSmatter
//
//  Created by Dan Beers on 11/14/24.
//

import SwiftUI

struct Raindrop: Hashable, Equatable {
    var x: Double
    var removalDate: Date
    var speed: Double
}

class Storm: ObservableObject {
    var drops = Set<Raindrop>()

    func update(to date: Date) {
        drops = drops.filter { $0.removalDate > date }
        drops.insert(Raindrop(x: Double.random(in: 0...1), removalDate: date + 2, speed: Double.random(in: 1...2)))
    }
}

struct StormView: View {
    @StateObject private var storm = Storm()
    @State private var flashEffect = false
    @State private var imageScale = 1.5
    @State private var offsetImage = false
    let rainColor = Color(.darkGray)
    let blackTrees = Image("trees_background")

    var body: some View {
        ZStack {
            Color(flashEffect ? .white : .black)
//            Image("trees_background")
//                .resizable()
//                .clipped()
//                .scaledToFit()
//                .aspectRatio(contentMode: .fill)
//                .scaleEffect(imageScale)
//                .offset(y: offsetImage ? -200 : 0)
//                .onAppear() {
//                    withAnimation(.linear(duration: 20.0)) {
//                        setScale(scale: 2)
//                        offsetImage.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.2) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.6) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 10.1) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 15.2) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 19) {
//                        flashEffect.toggle()
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 19.1) {
//                        flashEffect.toggle()
//                    }
//                }
            TimelineView(.animation) { timeline in
                Canvas { context, size in
                    storm.update(to: timeline.date)

                    for drop in storm.drops {
                        let age = timeline.date.distance(to: drop.removalDate)
                        let rect = CGRect(x: drop.x * size.width, y: size.height - (size.height * age * drop.speed), width: 1, height: 25)
                        let shape = Capsule().path(in: rect)
                        context.fill(shape, with: .color(rainColor))
                    }
                }
            }
        .ignoresSafeArea()
        }

    }
    func setScale(scale: Double) {
        imageScale = scale
    }
}

struct StormView_Previews: PreviewProvider
{
    static var previews: some View
    {
        StormView()
            .preferredColorScheme(.dark)
    }
}

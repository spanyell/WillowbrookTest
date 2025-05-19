//
//  StormView.swift
//  WordSmatter
//
//  Created by Dan Beers on 11/14/24.
//

import SwiftUI

struct StormView: View
{
    @StateObject private var storm = Storm()
    @State private var flashEffect = false
    @State private var imageScale = 1.0
    @State private var offsetImage = false
    @State private var brightenImage = false
    
    let rainColor = Color(.darkGray)

    var body: some View
    {
        ZStack
        {
            Color(flashEffect ? .white : .black)
//            Image("inverted_water_fountain")
//                .resizable()
//                .clipped()
//                .scaledToFit()
//                .aspectRatio(contentMode: .fill)
//                .scaleEffect(imageScale)
//                .offset(y: offsetImage ? -200 : 0)
//                .brightness(brightenImage ? -0.96 : -1)
                .onAppear
                {
                    withAnimation(.linear(duration: 20.0))
                    {
//                        setScale(scale: 1.1)
//                        brightenImage.toggle()
//                        offsetImage.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.05)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.55)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.1)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.5)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.55)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10.1)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15.2)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 19)
                    {
                        flashEffect.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 19.1)
                    {
                        flashEffect.toggle()
                    }
                    
                }
            
            TimelineView(.animation)
            { timeline in
                Canvas
                { context, size in
                    storm.update(to: timeline.date)

                    for drop in storm.drops
                    {
                        let age = timeline.date.distance(to: drop.removalDate)
                        let rect = CGRect(x: drop.x * size.width, y: size.height - (size.height * age * drop.speed), width: 1, height: 25)
                        let shape = Capsule().path(in: rect)
                        context.fill(shape, with: .color(rainColor))
                    }
                }
            }
        }
        .ignoresSafeArea()
    }

    func setScale(scale: Double)
    {
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

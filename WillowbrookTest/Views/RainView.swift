//
//  RainView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/3/25.
//

import SwiftUI

struct RainView: View
{
    @StateObject private var storm = Storm()
    let rainColor = Color(.darkGray)
    
    var body: some View
    {
        ZStack
        {
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
            .ignoresSafeArea()
        }
    }
}
#Preview
{
    RainView()
}

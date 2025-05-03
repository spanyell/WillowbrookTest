//
//  Rain.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/3/25.
//

import Foundation

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

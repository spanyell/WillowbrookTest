//
//  ContentView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/2/25.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        ZStack
        {
            StartView()
        }
        .preferredColorScheme(.dark)
    }
    
}

#Preview
{
    ContentView()
        .preferredColorScheme(.dark)
}

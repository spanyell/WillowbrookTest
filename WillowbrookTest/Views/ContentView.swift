//
//  ContentView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            StoryView(choiceMade: .constant(0))


            //            NavigationStack {
            //                        NavigationLink(
            //                            destination: StoryView(choiceMade: .constant(0)),
            //                            label:
            //                                {
            //                                    Text("Play Game")
            //                                })
        }
        //           MainMenuView()

        
    }
  //      .ignoresSafeArea()

        

        
            
    
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

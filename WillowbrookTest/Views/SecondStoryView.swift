//
//  SecondStoryView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/18/25.
//

import SwiftUI

struct SecondStoryView: View
{
    @Binding var choiceMade: Int
    @State private var opacityText = false
    @State private var shadowText = false
    @State private var offsetChoices = false

    var body: some View
    {
        let currentPage: Willowbrook = willowbrookData[choiceMade]
        NavigationStack
        {
            ZStack
            {
                RainView()
                VStack
                {
                    Text("\(currentPage.storyText)")
                        .font(Font.custom("Hoefler Text", size: 20))

                        //    Text("\(currentPage.id)")

                        .foregroundStyle(.white)
                        .frame(width: 400)
                        .padding()
                    Ellipse()
                        .fill(.white)
                        .frame(width: 400, height: 10)
                        .padding()
                        .opacity(opacityText ? 1 : 0)
                        .shadow(radius: shadowText ? 5 : 10)
                        .addGlowEffect(color1: .white, color2: .gray, color3: .white)
                        .onAppear {
                            withAnimation(.linear(duration: 5)) {
                                opacityText.toggle()
                            }
                            withAnimation(.linear(duration: 10)) {
                                shadowText.toggle()
                            }
                        }

                    NavigationLink(destination: SecondStoryView(choiceMade: .constant(currentPage.choice1Destination)))
                    {
                        Text("\(currentPage.choice1)")
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .offset(y: offsetChoices ? 0 : 400)
                    }
                    

                    if currentPage.choice2Destination != nil
                    {
                        NavigationLink(destination: StoryView(choiceMade: .constant(currentPage.choice2Destination ?? 0)))
                        {
                            Text("\(currentPage.choice2 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(y: offsetChoices ? 0 : 400)
                        }
                        
                    }
                    
                    if currentPage.choice3Destination != nil
                    {
                        NavigationLink(destination: StoryView(choiceMade: .constant(currentPage.choice3Destination ?? 0)))
                        {
                            Text("\(currentPage.choice3 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(y: offsetChoices ? 0 : 400)
                        }
                        


                    }
                    if currentPage.choice4Destination != nil
                    {
                        NavigationLink(destination: StoryView(choiceMade: .constant(currentPage.choice4Destination ?? 0)))
                        {
                            Text("\(currentPage.choice4 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(y: offsetChoices ? 0 : 400)
                        }

                    }
                }
                .preferredColorScheme(.dark)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 5)) {
                        offsetChoices.toggle()
                    
                        
                    }
                }
            }
        }
    }
}
 #Preview {
    SecondStoryView(choiceMade: .constant(0))
 }

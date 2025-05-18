//
//  StoryView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/2/25.
//

import SwiftUI

struct StoryView: View

{
    @Binding var choiceMade: Int

    // StoryText States
    @State private var opacityStoryText = false
    @State private var blurStoryText = false
    @State private var spinStoryText = false
    @State private var shadowStoryText = false

    // Choices States
    @State private var offsetChoices = false
    @State private var blurChoices = false
    @State private var opacityChoices = false

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
                    // Story Text
                    Text("\(currentPage.storyText)")
                        .font(Font.custom("Hoefler Text", size: 20))
                        .foregroundStyle(.white)
                        .frame(width: 400)
                        .padding()
                        .blur(radius: blurStoryText ? 0 : 20)
                        .rotationEffect(.degrees(spinStoryText ? 0 : 720))

                    // Ellipse glow
                    Ellipse()
                        .fill(.white)
                        .frame(width: 400, height: 10)
                        .padding()
                        .opacity(opacityStoryText ? 1 : 0)
                        .shadow(radius: shadowStoryText ? 5 : 10)
                    // Not 100% sure the colors even matter.
                        .addGlowEffect(color1: .green, color2: .yellow, color3: .blue)
                        .onAppear
                        {
                            withAnimation(.linear(duration: 15))
                            {
                                opacityStoryText.toggle()
                            }
                            withAnimation(.linear(duration: 15))
                            {
                                shadowStoryText.toggle()
                            }
                        }

                    // Choices
                    NavigationLink(destination: StoryView(choiceMade: .constant(currentPage.choice1Destination)))
                    {
                        Text("\(currentPage.choice1)")
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .offset(y: offsetChoices ? 0 : 300)
                            .opacity(opacityChoices ? 1 : 0)
                            .blur(radius: blurChoices ? 0 : 10)
                    }

                    // Optional choices
                    if currentPage.choice2Destination != nil
                    {
                        NavigationLink(destination: StoryView(choiceMade: .constant(currentPage.choice2Destination ?? 0)))
                        {
                            Text("\(currentPage.choice2 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(y: offsetChoices ? 0 : 300)
                                .opacity(opacityChoices ? 1 : 0)
                                .blur(radius: blurChoices ? 0 : 10)
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
                                .offset(y: offsetChoices ? 0 : 300)
                                .opacity(opacityChoices ? 1 : 0)
                                .blur(radius: blurChoices ? 0 : 10)
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
                                .offset(y: offsetChoices ? 0 : 300)
                                .opacity(opacityChoices ? 1 : 0)
                                .blur(radius: blurChoices ? 0 : 10)
                        }
                    }
                }
                .preferredColorScheme(.dark)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .onAppear
                {
                    withAnimation(.easeInOut(duration: 5))
                    {
                        blurStoryText.toggle()
                        spinStoryText.toggle()
                        offsetChoices.toggle()
                        opacityChoices.toggle()
                        blurChoices.toggle()
                    }
                }
            }
        }
    }
}

#Preview
{
    StoryView(choiceMade: .constant(0))
}

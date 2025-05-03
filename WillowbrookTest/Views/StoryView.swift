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

//    var willowbrookInfo: Willowbrook

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



                    NavigationLink(destination: StoryView(choiceMade: .constant(currentPage.choice1Destination)))
                    {
                        Text("\(currentPage.choice1)")
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            
                    }

                    if currentPage.choice2Destination != nil
                    {
                        NavigationLink(destination: StoryView(choiceMade: .constant(currentPage.choice2Destination ?? 0)))
                        {
                            Text("\(currentPage.choice2 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
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
                        }
                    }
                }
                .preferredColorScheme(.dark)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview
{
    StoryView(choiceMade: .constant(0))
}

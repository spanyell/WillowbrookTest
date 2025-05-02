//
//  MainMenuView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/2/25.
//

import SwiftUI

struct MainMenuView: View {
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    let newGame = Array("NEW GAME")
    let loadGame = Array("LOAD GAME")
    let continueGame = Array("CONTINUE")
    let quitGame = Array("QUIT GAME")
    
    @State private var counter = 0
    @State private var fadeInMenu = false
    @State private var flipAngleNewGame = Double.zero
    @State private var flipAngleLoadGame = Double.zero
    @State private var flipAngleContinueGame = Double.zero
    @State private var flipAngleQuitGame = Double.zero
    @State private var zoomInTitle = false
    
    
    var body: some View {
        
        VStack(spacing: 30) {
            Text("THE\n WILLOWBROOK\n LOOP")
                .multilineTextAlignment(.center)
                .offset(y: 300)
                .font(Font.custom("Hoefler Text", size: zoomInTitle ? 40 : 20))
                .foregroundStyle(.white)
                .opacity(fadeInMenu ? 1 : 0)
                .blur(radius: zoomInTitle ? 0 : 10)
                
            Spacer()
            HStack(spacing: 0) {
                ForEach(0..<newGame.count, id: \.self) { flip in
                    Text(String(newGame[flip]))
                        .font(Font.custom("Hoefler Text", size: 20))
                        .foregroundColor(.white)
                        .opacity(fadeInMenu ? 1 : 0)
                        .rotation3DEffect(.degrees(flipAngleNewGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                        .animation(.default.delay(Double(flip) * 0.1),
                                   value: flipAngleNewGame)
                }
            }

            HStack(spacing: 0) {
                    ForEach(0..<loadGame.count, id: \.self) { flip in
                        Text(String(loadGame[flip]))
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .opacity(fadeInMenu ? 1 : 0)
                            .rotation3DEffect(.degrees(flipAngleLoadGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                            .animation(.default.delay(Double(flip) * 0.1),
                                       value: flipAngleLoadGame)
                            .onTapGesture {
               //                 SoundManager.instance.playEffectSound(sound: .ThunderCrash)
                            }
                }
            }
            HStack(spacing: 0) {
                    ForEach(0..<continueGame.count, id: \.self) { flip in
                        Text(String(continueGame[flip]))
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .opacity(fadeInMenu ? 1 : 0)
                            .rotation3DEffect(.degrees(flipAngleContinueGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                            .animation(.default.delay(Double(flip) * 0.1),
                                       value: flipAngleContinueGame)
                }
            }
            HStack(spacing: 0) {
                    ForEach(0..<quitGame.count, id: \.self) { flip in
                        Text(String(quitGame[flip]))
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .opacity(fadeInMenu ? 1 : 0)
                            .rotation3DEffect(.degrees(flipAngleQuitGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                            .animation(.default.delay(Double(flip) * 0.1),
                                       value: flipAngleQuitGame)
                }
            }
            .onReceive(timer) { time in
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    flipAngleNewGame = (flipAngleNewGame == .zero) ? 360 : .zero
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    flipAngleLoadGame = (flipAngleLoadGame == .zero) ? 360 : .zero
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    flipAngleContinueGame = (flipAngleContinueGame == .zero) ? 360 : .zero
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    flipAngleQuitGame = (flipAngleQuitGame == .zero) ? 360 : .zero
                }
            }
        }
        .onAppear() {
            // 19 is the lucky number on the DispatchQueue
            DispatchQueue.main.asyncAfter(deadline: .now() + 19) {
                withAnimation(Animation.linear(duration: 3)) {
                    fadeInMenu.toggle()
                withAnimation(.linear(duration: 10)) {
                        zoomInTitle.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
        .preferredColorScheme(.dark)
}

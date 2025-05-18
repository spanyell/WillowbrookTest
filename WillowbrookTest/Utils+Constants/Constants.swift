//
//  Constants.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/2/25.
//

import Foundation
import AVKit
import SwiftUI

struct Constants {
    static let RainAndThunder = NSDataAsset(name: "RainAndThunder")
    static let ThunderCrash = NSDataAsset(name: "ThunderCrash")
    static let MainViewMuic = NSDataAsset(name: "MainViewMusic")
}

extension View
{
    func addGlowEffect(color1: Color, color2: Color, color3: Color) -> some View
    {
        foregroundColor(Color(hue: 0.5, saturation: 0.8, brightness: 1))
            .background
            {
                self
                    .foregroundColor(color1).blur(radius: 0).brightness(0.8)
            }
            .background
            {
                self
                    .foregroundColor(color2).blur(radius: 4).brightness(0.35)
            }
            .background
            {
                self
                    .foregroundColor(color3).blur(radius: 2).brightness(0.35)
            }
            .background
            {
                self
                    .foregroundColor(color3).blur(radius: 12).brightness(0.35)
            }
    }
}

/*
 * Copyright 2021 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import SwiftUI

public protocol NamedColors {
    var palette: [Color.Named: UIColor] { get }
}

public extension Color {

    enum Palette: String, CaseIterable {
        case black,
             white,
             green,
             red,
             blue,
             turquoise,
             grey,
             darkGrey,
             midGrey,
             lightGrey,
             teal,
             yellow,
             darkModeGreen,
             darkModeRed,
             darkNavy,
             darkNavy2,
             darkNavy3,
             lightBlue,
             navy,
             whiteDark,
             green2,
             grey5,
             pink,
             pinkDark,
             yellowLight,
             yellowDark

        public var hex: String {
            switch self {
            case .black: return "#0B0C0C"
            case .white: return "#FFFFFF"
            case .green: return "#00703C"
            case .red: return "#D4351C"
            case .blue: return "#1D70B8"
            case .turquoise: return "#28A197"
            case .grey: return "#282D30"
            case .darkGrey: return "#505A5F"
            case .midGrey: return "#B1B4B6"
            case .lightGrey: return "#F3F2F1"
            case .teal: return "#5BC0C6"
            case .yellow: return "#FFDD00"
            case .darkModeGreen: return "#188659"
            case .darkModeRed: return "#F26954"
            case .darkNavy: return "#0D1C29"
            case .darkNavy2: return "#061625"
            case .darkNavy3: return "#092537"
            case .lightBlue: return "#D7E4F2"
            case .navy: return "#0A2740"
            case .whiteDark: return "#262626"
            case .green2: return "#85994B"
            case .grey5: return "#3B3838"
            case .pink: return "#D53880"
            case .pinkDark: return "#BB94FF"
            case .yellowLight: return "#FFBF47"
            case .yellowDark: return "#FEFF4F"
            }
        }

        public var uiColour: UIColor {
            UIColor(hexString: hex)
        }

        public var colour: Color {
            Color(hexString: hex)
        }
    }
}

public extension UIColor {
    convenience init(darkColour: UIColor, lightColour: UIColor) {
        self.init { $0.userInterfaceStyle == .dark ? darkColour : lightColour }
    }

    convenience init(dark: Color.Palette, light: Color.Palette) {
        self.init(darkColour: dark.uiColour, lightColour: light.uiColour)
    }
}

extension UIColor {
    open class Colors: NamedColors {

        public static let defaultPalette: [Color.Named: UIColor] = [
            .black: UIColor(dark: .white, light: .black),
            .white: UIColor(dark: .whiteDark, light: .white),
            .constantWhite: Color.Palette.white.uiColour,
            .green: UIColor(dark: .darkModeGreen, light: .green),
            .green2: Color.Palette.green2.uiColour,
            .blue: UIColor(dark: .teal, light: .blue),
            .turquoise: Color.Palette.turquoise.uiColour,
            .red: UIColor(dark: .darkModeRed, light: .red),
            .grey: Color.Palette.grey.uiColour,
            .darkGrey: UIColor(dark: .midGrey, light: .darkGrey),
            .midGrey: Color.Palette.midGrey.uiColour,
            .lightGrey: UIColor(dark: .black, light: .lightGrey),
            .grey5: Color.Palette.grey5.uiColour,
            .pink: UIColor(dark: .pinkDark, light: .pink),
            .yellow: UIColor(dark: .yellowDark, light: .yellowLight),
            .navBarBackground: UIColor(dark: .blue, light: .whiteDark),
            .navy: Color.Palette.navy.uiColour,
            .darkNavy: Color.Palette.darkNavy.uiColour,
            .darkNavy2: Color.Palette.darkNavy2.uiColour,
            .darkNavy3: Color.Palette.darkNavy3.uiColour,
            .lightBlue: Color.Palette.lightBlue.uiColour
        ]

        public init() {}

        open var palette: [Color.Named: UIColor] = Colors.defaultPalette
    }
}

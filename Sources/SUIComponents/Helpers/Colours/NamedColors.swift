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

private typealias Primary = Color.Palette.Primary
private typealias DarkMode = Color.Palette.DarkMode

public protocol NamedColors {
    var palette: [Color.Named: UIColor] { get }
}

public extension Color {

    enum Palette: String, CaseIterable {
        @available(*, deprecated, message: "Use Color.Palette.Primary.black")
        case black
        @available(*, deprecated, message: "Use Color.Palette.Primary.white")
        case white
        @available(*, deprecated, message: "Use Color.Palette.Primary.green")
        case green
        @available(*, deprecated, message: "Use Color.Palette.Primary.red")
        case red
        @available(*, deprecated, message: "Use Color.Palette.Primary.blue")
        case blue
        @available(*, deprecated, message: "Use Color.Palette.Primary.turquoise")
        case turquoise
        @available(*, deprecated, message: "Use Color.Palette.Primary.grey")
        case grey
        @available(*, deprecated, message: "Use Color.Palette.Primary.darkGrey")
        case darkGrey
        @available(*, deprecated, message: "Use Color.Palette.Primary.midGrey")
        case midGrey
        @available(*, deprecated, message: "Use Color.Palette.Primary.lightGrey")
        case lightGrey
        @available(*, deprecated, message: "Use Color.Palette.Primary.teal")
        case teal
        @available(*, deprecated, message: "Use Color.Palette.Primary.yellow")
        case yellow
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.primaryGreen")
        case darkModeGreen
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.primaryRed")
        case darkModeRed
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.darkNavy")
        case darkNavy
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.darkNavy2")
        case darkNavy2
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.darkNavy3")
        case darkNavy3
        @available(*, deprecated, message: "Use Color.Palette.Primary.lightBlue")
        case lightBlue
        @available(*, deprecated, message: "Use Color.Palette.Primary.navy")
        case navy
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.whiteDark")
        case whiteDark
        @available(*, deprecated, message: "Use Color.Palette.Primary.green2")
        case green2
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.grey5")
        case grey5
        @available(*, deprecated, message: "Use Color.Palette.Primary.pink")
        case pink
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.pinkDark")
        case pinkDark
        @available(*, deprecated, message: "Use Color.Palette.Primary.yellowLight")
        case yellowLight
        @available(*, deprecated, message: "Use Color.Palette.DarkMode.yellowDark")
        case yellowDark

        @available(*, deprecated, message: "Use Color.Palette.Primary.allCases or Color.Palette.DarkMode.allCases")
        public static var allCases: [Palette] {
            [
                .black, .white, .green, .red, .blue, .turquoise, .grey, .darkGrey, .midGrey, .lightGrey,
                .teal, .yellow, .darkModeGreen, .darkModeRed, .darkNavy, .darkNavy2, .darkNavy3, .lightBlue,
                .navy, .whiteDark, .green2, .grey5, .pink, .pinkDark, .yellowLight, .yellowDark
            ]
        }

        @available(*, deprecated, message: "Use Color.Palette.Primary or Color.Palette.DarkMode")
        public var hex: String {
            switch self {
            case .black: return Primary.black.hex
            case .white: return Primary.white.hex
            case .green: return Primary.green.hex
            case .red: return Primary.red.hex
            case .blue: return Primary.blue.hex
            case .turquoise: return Primary.turquoise.hex
            case .grey: return Primary.grey.hex
            case .darkGrey: return Primary.darkGrey.hex
            case .midGrey: return Primary.midGrey.hex
            case .lightGrey: return Primary.lightGrey.hex
            case .teal: return Primary.teal.hex
            case .yellow: return Primary.yellow.hex
            case .darkModeGreen: return DarkMode.primaryGreen.hex
            case .darkModeRed: return DarkMode.primaryRed.hex
            case .darkNavy: return DarkMode.darkNavy.hex
            case .darkNavy2: return DarkMode.darkNavy2.hex
            case .darkNavy3: return DarkMode.darkNavy3.hex
            case .lightBlue: return Primary.lightBlue.hex
            case .navy: return Primary.navy.hex
            case .whiteDark: return DarkMode.whiteDark.hex
            case .green2: return Primary.green2.hex
            case .grey5: return DarkMode.grey5.hex
            case .pink: return Primary.pink.hex
            case .pinkDark: return DarkMode.pinkDark.hex
            case .yellowLight: return Primary.yellowLight.hex
            case .yellowDark: return DarkMode.yellowDark.hex
            }
        }

        @available(*, deprecated, message: "Use Color.Palette.Primary or Color.Palette.DarkMode")
        public var uiColour: UIColor {
            UIColor(hexString: hex)
        }

        @available(*, deprecated, message: "Use Color.Palette.Primary or Color.Palette.DarkMode")
        public var colour: Color {
            Color(hexString: hex)
        }
    }
}

public extension Color.Palette {

    enum Primary: String, CaseIterable {
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
             lightBlue,
             navy,
             green2,
             pink,
             yellowLight

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
            case .lightBlue: return "#D7E4F2"
            case .navy: return "#0A2740"
            case .green2: return "#85994B"
            case .pink: return "#D53880"
            case .yellowLight: return "#FFBF47"
            }
        }

        public var uiColour: UIColor {
            UIColor(hexString: hex)
        }

        public var colour: Color {
            Color(hexString: hex)
        }
    }

    enum DarkMode: String, CaseIterable {
        case primaryGreen,
             primaryRed,
             darkNavy,
             darkNavy2,
             darkNavy3,
             whiteDark,
             grey5,
             pinkDark,
             yellowDark

        public var hex: String {
            switch self {
            case .primaryGreen: return "#188659"
            case .primaryRed: return "#F26954"
            case .darkNavy: return "#0D1C29"
            case .darkNavy2: return "#061625"
            case .darkNavy3: return "#092537"
            case .whiteDark: return "#262626"
            case .grey5: return "#3B3838"
            case .pinkDark: return "#BB94FF"
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

    @available(*, deprecated, message: "Use Color.Palette.Primary / Color.Palette.DarkMode tokens")
    convenience init(dark: Color.Palette, light: Color.Palette) {
        self.init(darkColour: dark.uiColour, lightColour: light.uiColour)
    }

    convenience init(dark: Color.Palette.Primary, light: Color.Palette.Primary) {
        self.init(darkColour: dark.uiColour, lightColour: light.uiColour)
    }

    convenience init(dark: Color.Palette.DarkMode, light: Color.Palette.Primary) {
        self.init(darkColour: dark.uiColour, lightColour: light.uiColour)
    }

    convenience init(dark: Color.Palette.Primary, light: Color.Palette.DarkMode) {
        self.init(darkColour: dark.uiColour, lightColour: light.uiColour)
    }
}

extension UIColor {
    open class Colors: NamedColors {

        public static let defaultPalette: [Color.Named: UIColor] = [
            .black: UIColor(dark: Primary.white, light: Primary.black),
            .white: UIColor(dark: DarkMode.whiteDark, light: Primary.white),
            .constantWhite: Primary.white.uiColour,
            .green: UIColor(dark: DarkMode.primaryGreen, light: Primary.green),
            .green2: Primary.green2.uiColour,
            .blue: UIColor(dark: Primary.teal, light: Primary.blue),
            .turquoise: Primary.turquoise.uiColour,
            .red: UIColor(dark: DarkMode.primaryRed, light: Primary.red),
            .grey: Primary.grey.uiColour,
            .darkGrey: UIColor(dark: Primary.midGrey, light: Primary.darkGrey),
            .midGrey: Primary.midGrey.uiColour,
            .lightGrey: UIColor(dark: Primary.black, light: Primary.lightGrey),
            .grey5: DarkMode.grey5.uiColour,
            .pink: UIColor(dark: DarkMode.pinkDark, light: Primary.pink),
            .yellow: UIColor(dark: DarkMode.yellowDark, light: Primary.yellowLight),
            .navBarBackground: UIColor(dark: Primary.blue, light: DarkMode.whiteDark),
            .navy: Primary.navy.uiColour,
            .darkNavy: DarkMode.darkNavy.uiColour,
            .darkNavy2: DarkMode.darkNavy2.uiColour,
            .darkNavy3: DarkMode.darkNavy3.uiColour,
            .lightBlue: Primary.lightBlue.uiColour
        ]

        public init() {}

        open var palette: [Color.Named: UIColor] = Colors.defaultPalette
    }
}

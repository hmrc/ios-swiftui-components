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

import SwiftUI
import UIKit

public extension Color {

    enum Named: String, CaseIterable, ColorServiceInjected {
        case black,
             white,
             constantWhite,
             green,
             green2,
             blue,
             turquoise,
             red,
             grey,
             darkGrey,
             midGrey,
             lightGrey,
             grey5,
             pink,
             yellow,
             navBarBackground,
             navy,
             darkNavy,
             darkNavy2,
             darkNavy3,
             lightBlue

        @available(*, deprecated, renamed: "green")
        public static var green1: Named { .green }

        @available(*, deprecated, renamed: "turquoise")
        public static var teal: Named { .turquoise }

        @available(*, deprecated, renamed: "darkGrey")
        public static var grey1: Named { .darkGrey }

        @available(*, deprecated, renamed: "midGrey")
        public static var grey2: Named { .midGrey }

        @available(*, deprecated, renamed: "lightGrey")
        public static var grey3: Named { .lightGrey }

        @available(*, deprecated, renamed: "navBarBackground")
        public static var grey4: Named { .navBarBackground }

        @available(*, deprecated, message: "Use Color.Semantic.allColors")
        public static var allColors: [(String, Color)] {
            allCases.map { ("\($0.rawValue) (\($0.colour.hexString ?? "#------"))", $0.colour) }
        }

        @available(*, deprecated, message: "Use a Color.Semantic token, or Color.Palette.Primary / Color.Palette.DarkMode")
        public var colour: Color {
            Color(uiColour)
        }

        @available(*, deprecated, message: "Use a Color.Semantic token, or Color.Palette.Primary / Color.Palette.DarkMode")
        public var uiColour: UIColor {
            colorService.colors.palette[self]
                ?? UIColor.Colors.defaultPalette[self]
                ?? .clear
        }
    }

    @available(*, deprecated, message: "Use init(dark:light:) with Color.Palette.Primary / Color.Palette.DarkMode tokens")
    init(dark: Named, light: Named) {
        self.init(UIColor(darkColour: dark.uiColour, lightColour: light.uiColour))
    }

    init(dark: Palette.DarkMode, light: Palette.Primary) {
        self.init(UIColor(dark: dark, light: light))
    }

    init(dark: Palette.Primary, light: Palette.Primary) {
        self.init(UIColor(dark: dark, light: light))
    }

    init(dark: Palette.Primary, light: Palette.DarkMode) {
        self.init(UIColor(dark: dark, light: light))
    }
}

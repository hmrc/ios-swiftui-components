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

private typealias Primary = Color.Palette.Primary
private typealias DarkMode = Color.Palette.DarkMode

public protocol SemanticColors {
    var darkText: Color { get }
    var lightText: Color { get }
    var linkText: Color { get }
    var errorText: Color { get }
    var infoText: Color { get }
    var expandableButtonText: Color { get }

    var pageBackground: Color { get }
    var whiteBackground: Color { get }
    var headerBackground: Color { get }
    var onboardingBackground: Color { get }
    var onboardingPagerViewBackground: Color { get }
    var confirmationBackground: Color { get }

    var cardBackground: Color { get }
    var cardBackgroundSelected: Color { get }
    var cardText: Color { get }
    var cardShadow: Color { get }

    var tileBackground: Color { get }
    var tileHeading: Color { get }
    var tileText: Color { get }

    var infoMessageText: Color { get }
    var infoMessageWarningBackground: Color { get }

    var menuCardBackground: Color { get }
    var menuCardWhiteBackground: Color { get }
    var menuPageBackground: Color { get }

    var divider: Color { get }
    var insetBar: Color { get }

    var primaryButtonBackground: Color { get }
    var primaryButtonBaseline: Color { get }
    var primaryButtonDisabledBackground: Color { get }
    var primaryButtonDisabledText: Color { get }
    var primaryButtonHighlightedBackground: Color { get }
    var primaryButtonHighlightedBaseline: Color { get }
    var primaryButtonText: Color { get }

    var secondaryButtonBackground: Color { get }
    var secondaryButtonHighlightedBackground: Color { get }
    var secondaryButtonText: Color { get }

    var statusCardIconDefaultTint: Color { get }
    var switchTint: Color { get }
    var switchTintSelected: Color { get }
    var switchBorder: Color { get }

    var chartStripeBackground: Color { get }

    var textInputBorder: Color { get }
    var textInputLeftViewTint: Color { get }
    var textFieldBackground: Color { get }
    var textFieldFocus: Color { get }
    var fieldLabel: Color { get }
    var fieldFocusBorder: Color { get }

    var navBarBackground: Color { get }
    var navBarDarkModeBackground: Color { get }
    var prefixBackgroundColor: Color { get }
}

public extension SemanticColors {
    var infoMessageWarningBackground: Color { Color(dark: DarkMode.yellowDark, light: Primary.yellowLight) }
    var switchBorder: Color { Primary.midGrey.colour }
    var chartStripeBackground: Color { Color(dark: DarkMode.whiteDark, light: Primary.white) }
}

extension Color {
    open class SemanticColors: SUIComponents.SemanticColors {

        public init() {}

        open var darkText = Color(dark: Primary.white, light: Primary.black)
        open var lightText = Color(dark: DarkMode.whiteDark, light: Primary.white)
        open var linkText = Color(dark: Primary.teal, light: Primary.blue)
        open var errorText = Color(dark: DarkMode.primaryRed, light: Primary.red)
        open var infoText = Color(dark: Primary.midGrey, light: Primary.darkGrey)
        open var expandableButtonText = Color(dark: Primary.teal, light: Primary.blue)

        open var pageBackground = Color(dark: DarkMode.darkNavy2, light: Primary.lightGrey)
        open var whiteBackground = Color(dark: Primary.lightGrey, light: Primary.white)
        open var headerBackground = Color(dark: Primary.navy, light: Primary.blue)
        open var onboardingBackground = Color(dark: DarkMode.darkNavy2, light: Primary.lightGrey)
        open var onboardingPagerViewBackground = Color(dark: DarkMode.darkNavy3, light: Primary.white)
        open var confirmationBackground = Color(dark: DarkMode.primaryGreen, light: Primary.green)

        open var cardBackground = Color(dark: DarkMode.darkNavy3, light: Primary.white)
        open var cardBackgroundSelected = Color(dark: Primary.navy, light: Primary.lightBlue)
        open var cardText = Color(dark: Primary.white, light: Primary.black)
        open var cardShadow = Color(
            UIColor(
                darkColour: .clear,
                lightColour: Primary.lightGrey.uiColour.darken(0.08)
            )
        )

        open var tileBackground = Color(dark: DarkMode.darkNavy3, light: Primary.lightGrey)
        open var tileHeading = Color(dark: Primary.white, light: Primary.blue)
        open var tileText = Color(dark: Primary.white, light: Primary.black)

        open var infoMessageText = Color(dark: DarkMode.darkNavy2, light: Primary.white)
        open var infoMessageWarningBackground = Color(dark: DarkMode.yellowDark, light: Primary.yellowLight)

        open var menuCardBackground = Color(dark: Primary.black, light: Primary.lightGrey)
        open var menuCardWhiteBackground = Color(dark: DarkMode.whiteDark, light: Primary.white)
        open var menuPageBackground = Color(dark: DarkMode.whiteDark, light: Primary.white)

        open var divider = Primary.midGrey.colour
        open var insetBar = Color(dark: Primary.midGrey, light: Primary.midGrey)

        open var primaryButtonBackground = Color(dark: DarkMode.primaryGreen, light: Primary.green)
        open var primaryButtonBaseline = Color(UIColor(dark: DarkMode.primaryGreen, light: Primary.green).darken(0.4))
        open var primaryButtonDisabledBackground = Color(dark: Primary.midGrey, light: Primary.darkGrey)
        open var primaryButtonDisabledText = Color(dark: DarkMode.whiteDark, light: Primary.white)
        open var primaryButtonHighlightedBackground = Color(UIColor(dark: DarkMode.primaryGreen, light: Primary.green).lighten(0.16))
        open var primaryButtonHighlightedBaseline = Color(UIColor(dark: DarkMode.primaryGreen, light: Primary.green).darken(0.24))
        open var primaryButtonText = Color(dark: Primary.white, light: Primary.white)

        open var secondaryButtonBackground = Color(dark: DarkMode.darkNavy2, light: Primary.white)
        open var secondaryButtonHighlightedBackground = Color(
            UIColor(
                darkColour: UIColor(dark: Primary.midGrey, light: Primary.darkGrey).darken(0.4),
                lightColour: UIColor(dark: Primary.teal, light: Primary.blue).lighten(0.84)
            )
        )
        open var secondaryButtonText = Color(dark: Primary.white, light: Primary.blue)

        open var statusCardIconDefaultTint = Color(dark: Primary.midGrey, light: Primary.darkGrey)
        open var switchTint = Color(dark: Primary.teal, light: Primary.blue)
        open var switchTintSelected = Color(UIColor(dark: Primary.teal, light: Primary.blue).lighten(0.16))
        open var switchBorder = Primary.midGrey.colour

        open var chartStripeBackground = Color(dark: DarkMode.whiteDark, light: Primary.white)

        open var textInputBorder = Color(dark: Primary.white, light: Primary.black)
        open var textInputLeftViewTint = Color(dark: Primary.white, light: Primary.darkGrey)
        open var textFieldBackground = Color(dark: DarkMode.darkNavy3, light: Primary.white)
        open var textFieldFocus = Color(dark: Primary.teal, light: Primary.blue)
        open var fieldLabel = Color(dark: Primary.white, light: Primary.grey)
        open var fieldFocusBorder = Color(dark: Primary.yellow, light: Primary.yellow)

        open var navBarBackground = Color(dark: DarkMode.darkNavy3, light: Primary.blue)
        open var navBarDarkModeBackground = Color(dark: Primary.blue, light: DarkMode.whiteDark)
        open var prefixBackgroundColor = Color(dark: DarkMode.grey5, light: Primary.lightGrey)
    }
}

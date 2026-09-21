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

extension Color {
    open class SemanticColors: SUIComponents.SemanticColors {

        public init() {}

        open var darkText = Color.Named.black.colour
        open var lightText = Color.Named.white.colour
        open var linkText = Color.Named.blue.colour
        open var errorText = Color.Named.red.colour
        open var infoText = Color.Named.darkGrey.colour
        open var expandableButtonText = Color.Named.blue.colour

        open var pageBackground = Color(dark: .darkNavy2, light: .lightGrey)
        open var whiteBackground = Color(dark: .lightGrey, light: .white)
        open var headerBackground = Color(dark: .navy, light: .blue)
        open var onboardingBackground = Color(dark: .darkNavy2, light: .lightGrey)
        open var onboardingPagerViewBackground = Color(dark: .darkNavy3, light: .white)
        open var confirmationBackground = Color.Named.green.colour

        open var cardBackground = Color(dark: .darkNavy3, light: .white)
        open var cardBackgroundSelected = Color(dark: .navy, light: .lightBlue)
        open var cardText = Color.Named.black.colour
        open var cardShadow = Color(
            UIColor(
                darkColour: .clear,
                lightColour: Color.Named.lightGrey.uiColour.darken(0.08)
            )
        )

        open var tileBackground = Color(dark: .darkNavy3, light: .lightGrey)
        open var tileHeading = Color(dark: .constantWhite, light: .blue)
        open var tileText = Color.Named.black.colour

        open var infoMessageText = Color(dark: .darkNavy2, light: .constantWhite)

        open var menuCardBackground = Color.Named.lightGrey.colour
        open var menuCardWhiteBackground = Color.Named.white.colour
        open var menuPageBackground = Color.Named.white.colour

        open var divider = Color.Named.midGrey.colour
        open var insetBar = Color.Named.midGrey.colour

        open var primaryButtonBackground = Color.Named.green.colour
        open var primaryButtonBaseline = Color(Color.Named.green.uiColour.darken(0.4))
        open var primaryButtonDisabledBackground = Color.Named.darkGrey.colour
        open var primaryButtonDisabledText = Color.Named.white.colour
        open var primaryButtonHighlightedBackground = Color(Color.Named.green.uiColour.lighten(0.16))
        open var primaryButtonHighlightedBaseline = Color(Color.Named.green.uiColour.darken(0.24))
        open var primaryButtonText = Color.Named.constantWhite.colour

        open var secondaryButtonBackground = Color(dark: .darkNavy2, light: .white)
        open var secondaryButtonHighlightedBackground = Color(
            UIColor(
                darkColour: Color.Named.darkGrey.uiColour.darken(0.4),
                lightColour: Color.Named.blue.uiColour.lighten(0.84)
            )
        )
        open var secondaryButtonText = Color(dark: .constantWhite, light: .blue)

        open var statusCardIconDefaultTint = Color.Named.darkGrey.colour
        open var switchTint = Color.Named.blue.colour
        open var switchTintSelected = Color(Color.Named.blue.uiColour.lighten(0.16))

        open var textInputBorder = Color.Named.black.colour
        open var textInputLeftViewTint = Color(dark: .constantWhite, light: .darkGrey)
        open var textFieldBackground = Color(dark: .darkNavy3, light: .white)
        open var textFieldFocus = Color.Named.blue.colour
        open var fieldLabel = Color(dark: .constantWhite, light: .grey)
        open var fieldFocusBorder = Color.Named.yellow.colour

        open var navBarBackground = Color(dark: .darkNavy3, light: .blue)
        open var navBarDarkModeBackground = Color.Named.navBarBackground.colour
        open var prefixBackgroundColor = Color(dark: .grey5, light: .lightGrey)
    }
}

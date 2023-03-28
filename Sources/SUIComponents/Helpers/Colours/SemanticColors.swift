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

public protocol SemanticColors {
    var darkText: Color { get set }
    var lightText: Color { get set }
    var linkText: Color { get set }
    var errorText: Color { get set }
    var infoText: Color { get set }
    var expandableButtonText: Color { get set }
    var cardBackground: Color { get set }
    var cardShadow: Color { get set }
    var pageBackground: Color { get set }
    var menuCardBackground: Color { get set }
    var menuPageBackground: Color { get set }
    var divider: Color { get set }
    var insetBar: Color { get set }
    var primaryButtonBackground: Color { get set }
    var primaryButtonDisabledBackground: Color { get set }
    var primaryButtonDisabledText: Color { get set }
    var primaryButtonHighlightedBackground: Color { get set }
    var primaryButtonText: Color { get set }
    var primaryButtonHighlightedBaseline: Color { get set }
    var primaryButtonBaseline: Color { get set }
    var statusCardIconDefaultTint: Color { get set }
    var switchTint: Color { get set }
    var switchTintSelected: Color { get set }
    var textInputBorder: Color { get set }
    var textInputLeftViewTint: Color { get set }
    var secondaryButtonText: Color { get set }
    var secondaryButtonBackground: Color { get set }
    var secondaryButtonHighlightedBackground: Color { get set }
    var whiteBackground: Color { get set }
}

extension Color {
    open class SemanticColors: SUIComponents.SemanticColors {
        
        public init() {}
        open var darkText = Color(UIColor(darkColour: Color.Named.black.uiColour, lightColour: Color.Named.black.uiColour))
        open var lightText = Color(UIColor(darkColour: Color.Named.white.uiColour, lightColour: Color.Named.white.uiColour))
        open var linkText = Color(UIColor(darkColour: Color.Named.blue.uiColour, lightColour: Color.Named.blue.uiColour))
        open var errorText = Color(UIColor(darkColour: Color.Named.red.uiColour, lightColour: Color.Named.red.uiColour))
        open var infoText = Color(UIColor(darkColour:  Color.Named.grey1.uiColour, lightColour: Color.Named.grey1.uiColour))
        open var expandableButtonText = Color(UIColor(darkColour: Color.Named.blue.uiColour, lightColour: Color.Named.blue.uiColour))
        open var cardBackground = Color(UIColor(darkColour: Color.Named.white.uiColour, lightColour: Color.Named.white.uiColour))
        open var cardShadow = Color(UIColor(darkColour: UIColor.clear, lightColour: Color.Named.grey3.uiColour.darken(0.08)))
        open var pageBackground = Color(UIColor(darkColour: Color.Named.grey3.uiColour, lightColour: Color.Named.grey3.uiColour))
        
        
        open var menuCardBackground = Color(UIColor(darkColour: Color.Named.grey3.uiColour, lightColour: Color.Named.grey3.uiColour))
        open var menuPageBackground = Color(UIColor(darkColour: Color.Named.white.uiColour, lightColour: Color.Named.white.uiColour))
        open var divider = Color(UIColor(darkColour: Color.Named.grey2.uiColour, lightColour: Color.Named.grey2.uiColour))
        open var insetBar = Color(UIColor(darkColour: Color.Named.grey2.uiColour, lightColour: Color.Named.grey2.uiColour))
        open var primaryButtonBackground = Color(UIColor(darkColour: Color.Named.green1.uiColour, lightColour: Color.Named.green1.uiColour))
        open var primaryButtonDisabledBackground = Color(UIColor(darkColour: Color.Named.grey1.uiColour, lightColour: Color.Named.grey1.uiColour))
        
        open var primaryButtonDisabledText = Color(UIColor(darkColour: Color.Named.white.uiColour, lightColour: Color.Named.white.uiColour))
        open var primaryButtonHighlightedBackground = Color(UIColor(darkColour: Color.Named.green1.uiColour.lighten(0.16), lightColour: Color.Named.green1.uiColour.lighten(0.16)))
        open var primaryButtonText = Color(UIColor(darkColour: Color.Named.white.uiColour, lightColour: Color.Named.white.uiColour))
        
        open var primaryButtonHighlightedBaseline = Color(UIColor(darkColour: Color.Named.green1.uiColour.darken(0.24), lightColour: Color.Named.green1.uiColour.darken(0.24)))
        open var primaryButtonBaseline = Color(UIColor(darkColour: Color.Named.green1.uiColour.darken(0.4), lightColour: Color.Named.green1.uiColour.darken(0.4)))
        open var statusCardIconDefaultTint = Color(UIColor(darkColour: Color.Named.grey1.uiColour, lightColour: Color.Named.grey1.uiColour))
        
        
        open var switchTint = Color(UIColor(darkColour: Color.Named.blue.uiColour, lightColour: Color.Named.blue.uiColour))
        open var switchTintSelected = Color(UIColor(darkColour: Color.Named.blue.uiColour.lighten(0.16), lightColour: Color.Named.blue.uiColour.lighten(0.16)))
        open var textInputBorder = Color(UIColor(darkColour: Color.Named.grey1.uiColour, lightColour: Color.Named.grey1.uiColour))
        open var textInputLeftViewTint = Color(UIColor(darkColour: Color.Named.grey1.uiColour, lightColour: Color.Named.grey1.uiColour))
        open var secondaryButtonText = Color(UIColor(darkColour: Color.Named.blue.uiColour, lightColour: Color.Named.blue.uiColour))
        open var secondaryButtonBackground = Color(UIColor(darkColour: Color.Named.white.uiColour, lightColour: Color.Named.white.uiColour))
        open var secondaryButtonHighlightedBackground = Color(UIColor(darkColour: Color.Named.grey1.uiColour.darken(0.4), lightColour: Color.Named.blue.uiColour.lighten(0.84)))
        open var whiteBackground = Color(UIColor(darkColour: Color.Named.grey3.uiColour, lightColour: Color.Named.white.uiColour))
    }
}

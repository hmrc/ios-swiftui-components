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
    open class SemanticLightColors: SemanticColors {
        
        public init() {}
        
        open var darkText = Color.Named.black.raw
        open var lightText = Color.Named.white.raw
        open var linkText = Color.Named.blue.raw
        open var errorText = Color.Named.red.raw
        open var infoText = Color.Named.grey1.raw
        open var expandableButtonText = Color.Named.blue.raw
        open var cardBackground = Color.Named.white.raw
        open var cardShadow = Color(hexString: "DFDEDD")
        open var pageBackground = Color.Named.grey3.raw
        open var menuCardBackground = Color.Named.grey3.raw
        open var menuPageBackground = Color.Named.white.raw
        open var divider = Color.Named.grey2.raw
        open var insetBar = Color.Named.grey2.raw
        open var primaryButtonBackground = Color.Named.green1.raw
        open var primaryButtonDisabledBackground = Color.Named.grey1.raw
        open var primaryButtonDisabledText = Color.Named.white.raw
        open var primaryButtonHighlightedBackground = Color(hexString: "28865B")
        open var primaryButtonText = Color.Named.white.raw
        open var primaryButtonHighlightedBaseline = Color(hexString: "00552D")
        open var primaryButtonBaseline = Color(hexString: "004324")
        open var statusCardIconDefaultTint = Color.Named.grey1.raw
        open var switchTint = Color.Named.blue.raw
        open var switchTintSelected = Color(hexString: "4186C3")
        open var textInputBorder = Color.Named.grey1.raw
        open var textInputLeftViewTint = Color.Named.grey1.raw
        open var secondaryButtonText = Color.Named.blue.raw
        open var secondaryButtonBackground = Color.clear
        open var secondaryButtonHighlightedBackground = Color(hexString: "DAE8F3")
        open var whiteBackground = Color.Named.white.raw
    }
    
    open class SemanticDarkColors: SemanticColors {
        
        public init() {}
        
        open var darkText = Color.Named.black.raw
        open var lightText = Color.Named.white.raw
        open var linkText = Color.Named.blue.raw
        open var errorText = Color.Named.red.raw
        open var infoText = Color.Named.grey1.raw
        open var expandableButtonText = Color.Named.blue.raw
        open var cardBackground = Color.Named.white.raw
        open var cardShadow = Color.clear
        open var pageBackground = Color.Named.grey3.raw
        open var menuCardBackground = Color.Named.grey3.raw
        open var menuPageBackground = Color.Named.white.raw
        open var divider = Color.Named.grey2.raw
        open var insetBar = Color.Named.grey2.raw
        open var primaryButtonBackground = Color.Named.green1.raw
        open var primaryButtonDisabledBackground = Color.Named.grey1.raw
        open var primaryButtonDisabledText = Color.Named.white.raw
        open var primaryButtonHighlightedBackground = Color(hexString: "28865B")
        open var primaryButtonText = Color.Named.white.raw
        open var primaryButtonHighlightedBaseline = Color(hexString: "00552D")
        open var primaryButtonBaseline = Color(hexString: "004324")
        open var statusCardIconDefaultTint = Color.Named.grey1.raw
        open var switchTint = Color.Named.blue.raw
        open var switchTintSelected = Color(hexString: "4186C3")
        open var textInputBorder = Color.Named.grey1.raw
        open var textInputLeftViewTint = Color.Named.grey1.raw
        open var secondaryButtonText = Color.Named.blue.raw
        open var secondaryButtonBackground = Color.clear
        open var secondaryButtonHighlightedBackground = Color(hexString: "04111D")
        open var whiteBackground = Color.Named.grey3.raw
    }
}

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

public extension Color {

    @dynamicMemberLookup
    enum Semantic {

        private static var colours: SUIComponents.SemanticColors {
            SUIComponents.Components.Injection.Service.colorService.injectedObject.semanticColors
        }

        public static subscript(dynamicMember keyPath: KeyPath<SUIComponents.SemanticColors, Color>) -> Color {
            colours[keyPath: keyPath]
        }

        public static var allColors: [(String, Color)] {
            Mirror(reflecting: colours).children.compactMap { child in
                guard let label = child.label, let colour = child.value as? Color else {
                    return nil
                }
                return ("\(label) (\(colour.hexString ?? "#------"))", colour)
            }
        }

        @available(*, deprecated, renamed: "navBarBackground")
        public static var navigationBarBackgroundColor: Color { colours.navBarBackground }

        @available(*, deprecated, renamed: "navBarDarkModeBackground")
        public static var navBarDarkModeBackgroundColor: Color { colours.navBarDarkModeBackground }

        @available(*, deprecated, renamed: "prefixBackgroundColor")
        public static var prefixBackgroundColour: Color { colours.prefixBackgroundColor }
    }
}

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

public protocol HMRCFont {
    static var baseFont: UIFont { get }
}

public extension HMRCFont {
    static func font() -> Font {
        FontMetrics.scaledFont(for: baseFont)
    }
    static func font(for dynamicTypeSize: DynamicTypeSize) -> Font {
        FontMetrics.scaledFont(
            for: baseFont,
            compatibleWith: UITraitCollection(preferredContentSizeCategory: dynamicTypeSize.uiContentSizeCategory)
        )
    }
    static func uiFont() -> UIFont {
        FontMetrics.scaledUIFont(for: baseFont)
    }
}

public extension Font {
    // swiftlint:disable identifier_name
    private struct BaseFonts {
        static let h3: UIFont = UIFont.systemFont(ofSize: 48, weight: .bold)
        static let h4: UIFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        static let h5: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let bold: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        static let body: UIFont = UIFont.systemFont(ofSize: 16)
        static let debug: UIFont = UIFont.systemFont(ofSize: 12)
    }

    struct H3: HMRCFont {
        public static var baseFont: UIFont { BaseFonts.h3 }
    }
    struct H4: HMRCFont {
        public static var baseFont: UIFont { BaseFonts.h4 }
    }
    struct H5: HMRCFont {
        public static var baseFont: UIFont { BaseFonts.h5 }
    }
    struct Bold: HMRCFont {
        public static var baseFont: UIFont { BaseFonts.bold }
    }
    struct Body: HMRCFont {
        public static var baseFont: UIFont { BaseFonts.body }
    }
    struct Debug: HMRCFont {
        public static var baseFont: UIFont { BaseFonts.debug }
    }
    // swiftlint:enable identifier_name
}

extension DynamicTypeSize {
    var uiContentSizeCategory: UIContentSizeCategory {
        switch self {
        case .xSmall: return .extraSmall
        case .small: return .small
        case .medium: return .medium
        case .large: return .large
        case .xLarge: return .extraLarge
        case .xxLarge: return .extraExtraLarge
        case .xxxLarge: return .extraExtraExtraLarge
        case .accessibility1: return .accessibilityMedium
        case .accessibility2: return .accessibilityLarge
        case .accessibility3: return .accessibilityExtraLarge
        case .accessibility4: return .accessibilityExtraExtraLarge
        case .accessibility5: return .accessibilityExtraExtraExtraLarge
        @unknown default: return .large
        }
    }
}
